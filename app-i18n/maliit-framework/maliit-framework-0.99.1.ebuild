# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Core libraries of Maliit and server"
HOMEPAGE="https://github.com/maliit"
SRC_URI="https://github.com/maliit/framework/archive/${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+dbus doc +xcb wayland"

DEPEND="app-doc/doxygen
	dbus? ( sys-apps/dbus )
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	wayland? ( dev-libs/wayland )"

RDEPEND="${DEPEND}"
RESTRICT="mirror"

S="${WORKDIR}/framework-${PV}"

src_prepare() {
	epatch "${FILESDIR}/${PF}-Move-GDBus-code-generation-to-maliit-glib.patch"
	epatch "${FILESDIR}/${PF}-Remove-framework-dependency-from-maliit-glib.pc.patch"
	epatch "${FILESDIR}/${PF}-Use-cmake-instead-of-qmake-as-build-system.patch"
	epatch "${FILESDIR}/${PF}-Export-cmake-targets-for-Maliit-Plugins-and-GLib.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use dbus enable-dbus-activation)
		$(cmake-utils_use doc enable-docs)
		$(cmake-utils_use wayland enable-wayland)
		$(cmake-utils_use xcb enable-xcb)
	)

	cmake-utils_src_configure
}
