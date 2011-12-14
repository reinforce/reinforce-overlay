# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils cmake-utils

DESCRIPTION="Unity"
HOMEPAGE="https://launchpad.net/unity-2d"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EBZR_REPO_URI="lp:unity/4.0"
EBZR_PROJECT="unity"

RDEPEND="dev-util/cmake
	x11-libs/cairo
	gnome-base/dconf
	x11-libs/gdk-pixbuf
	dev-libs/glib
	dev-libs/json-glib
	>=x11-libs/gtk+-3.1
	dev-libs/libindicator
	x11-libs/qt-declarative
	x11-libs/gconf-qt
	x11-libs/dconf-qt
	x11-libs/dbusmenu-qt
	dev-libs/libdbusmenu
	x11-libs/bamf
	x11-libs/libqtbamf
	x11-libs/libqtdee
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
	x11-libs/libXi
	>=x11-wm/compiz-0.9"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}
