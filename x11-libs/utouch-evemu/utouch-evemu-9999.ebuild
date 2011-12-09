# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils autotools

DESCRIPTION="Kernel Device Emulation Library"
HOMEPAGE="https://launchpad.net/utouch-evemu"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:utouch-evemu"
EBZR_PROJECT="utouch-evemu"

RDEPEND="sys-devel/libtool
	sys-devel/automake
	x11-libs/mtdev
	dev-util/quilt
	app-text/xmlto"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
}

