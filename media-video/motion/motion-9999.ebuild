# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/motion/motion-3.2.12-r2.ebuild,v 1.3 2012/06/09 23:36:03 zmedico Exp $

EAPI=4
inherit eutils user git-2

DESCRIPTION="A software motion detector"
HOMEPAGE="http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome"

EGIT_REPO_URI="https://github.com/sackmotion/motion.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ppc ~x86"
IUSE="ffmpeg mysql postgres sdl +v4l"

RDEPEND="sys-libs/zlib
	virtual/jpeg
	ffmpeg? ( virtual/ffmpeg )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )"
DEPEND="${RDEPEND}
	v4l? ( virtual/os-headers media-libs/libv4l )
	sdl? ( media-libs/libsdl )"

pkg_setup() {
	enewuser motion -1 -1 -1 video
}

src_configure() {
	econf \
		$(use_with v4l) \
		$(use_with sdl) \
		$(use_with ffmpeg) \
		$(use_with mysql) \
		$(use_with postgres pgsql) \
		--without-optimizecpu
}

src_install() {
	emake \
		DESTDIR="${D}" \
		DOC='CHANGELOG CODE_STANDARD CREDITS FAQ README' \
		docdir=/usr/share/doc/${PF} \
		EXAMPLES='thread*.conf' \
		examplesdir=/usr/share/doc/${PF}/examples \
		install

	dohtml *.html

	newinitd "${FILESDIR}"/motion.initd-r2 motion
	newconfd "${FILESDIR}"/motion.confd motion

	mv -vf "${D}"/etc/motion{-dist,}.conf || die
}

pkg_postinst() {
	elog "You need to setup /etc/motion.conf before running"
	elog "motion for the first time."
	elog "You can install motion detection as a service, use:"
	elog "rc-update add motion default"
}
