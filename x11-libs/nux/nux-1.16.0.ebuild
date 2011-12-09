# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base

DESCRIPTION="An OpenGL toolkit"
SRC_URI="http://launchpad.net/nux/1.0/${PV}/+download/nux-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/nux"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0"
LICENSE="GPV-3"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-cpp/gtest
	dev-cpp/gmock
	media-libs/mesa
	media-libs/glew
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	dev-libs/glib
	dev-libs/libpcre
	x11-libs/libXxf86vm
	dev-libs/libsigc++
	sys-libs/libstdc++-v3
	x11-libs/libwnck
	x11-libs/utouch-geis
	x11-libs/utouch-evemu"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/add-nullptr-gcc4.5.patch
}
