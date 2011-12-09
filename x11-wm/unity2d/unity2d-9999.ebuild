# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils cmake-utils

DESCRIPTION="Unity 2D shared library"
HOMEPAGE="https://launchpad.net/unity-2d"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EBZR_REPO_URI="lp:unity-2d"
EBZR_PROJECT="unity-2d"

RDEPEND="dev-util/cmake[qt4]
	x11-libs/cairo
	gnome-base/dconf
	x11-libs/gdk-pixbuf
	dev-libs/glib
	x11-libs/gtk+:3
	dev-libs/libindicator
	x11-libs/nux
	x11-libs/qt-core
	x11-libs/qt-dbus
	x11-libs/qt-opengl
	x11-libs/qt-gui
	dev-libs/libsigc++
	x11-libs/startup-notification
	sys-libs/libstdc++-v3
	x11-libs/libwnck:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXext
	x11-libs/libXi"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}
