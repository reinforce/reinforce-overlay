# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="The GTK+ input context for Maliit"
HOMEPAGE="https://github.com/maliit"
SRC_URI="https://github.com/maliit/inputcontext-gtk/archive/${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="gtk2 gtk3 X"
REQUIRED_USE="|| ( gtk2 gtk3 )"

DEPEND="=app-i18n/maliit-framework-${PV}
	gtk2? ( x11-libs/gtk+:2 )
	gtk3? ( x11-libs/gtk+:3 )"

RDEPEND="${DEPEND}"
RESTRICT="mirror"

S="${WORKDIR}/inputcontext-gtk-${PV}"

src_prepare() {
        epatch "${FILESDIR}/${PF}-Use-cmake-instead-of-qmake-as-build-system.patch"
	epatch "${FILESDIR}/${PF}-Rename-meego-to-maliit.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable gtk2 GTK2)
		$(cmake-utils_use_enable gtk3 GTK3)
		$(cmake-utils_use_enable X X11)
	)

	cmake-utils_src_configure
}
