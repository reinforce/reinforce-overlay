# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils autotools

DESCRIPTION="Visual rendering toolkit for real-time applications - shared lib"
HOMEPAGE="https://launchpad.net/nux"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:nux"
EBZR_PROJECT="nux"

RDEPEND="media-libs/mesa
	media-libs/glew
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	dev-libs/glib
	dev-libs/libpcre
	x11-libs/libXxf86vm
	dev-libs/libsigc++
	sys-libs/libstdc++-v3
	x11-libs/libwnck:3
	x11-libs/utouch-geis"

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

