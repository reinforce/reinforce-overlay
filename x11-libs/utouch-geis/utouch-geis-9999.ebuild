# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils autotools

DESCRIPTION="An implementation of the GEIS (Gesture Engine Interface and Support) interface."
HOMEPAGE="https://launchpad.net/utouch-geis"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EBZR_REPO_URI="lp:utouch-geis"
EBZR_PROJECT="utouch-geis"

RDEPEND="sys-apps/dbus
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXi
	x11-libs/utouch-grail"

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

