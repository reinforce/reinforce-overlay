# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="System heartbeat client library"
HOMEPAGE="http://meego.gitorious.org/meego-middleware/libiphb"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="pic "

EGIT_REPO_URI="git://gitorious.org/meego-middleware/libiphb.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND="sys-libs/libdsme"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myconf="$(use_with pic)"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
}
