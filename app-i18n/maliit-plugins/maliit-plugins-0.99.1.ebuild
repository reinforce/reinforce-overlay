# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Contains the reference input method plugins, such as the Maliit Keyboard"
HOMEPAGE="https://github.com/maliit"
SRC_URI="https://github.com/maliit/plugins/archive/${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc hunspell +maliit-keyboard nemo-keyboard preedit"

DEPEND="=app-i18n/maliit-framework-${PV}
	hunspell? ( app-text/hunspell )"

RDEPEND="${DEPEND}"
RESTRICT="mirror"

S="${WORKDIR}/plugins-${PV}"

src_prepare() {
        epatch "${FILESDIR}/${PF}-Use-cmake-instead-of-qmake-as-build-system.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use doc enable-docs)
		$(cmake-utils_use hunspell enable-hunspell)
		$(cmake-utils_use maliit-keyboard enable-maliit-keyboard)
		$(cmake-utils_use nemo-keyboard enable-nemo-keyboard)
		$(cmake-utils_use preedit enable-preedit)
	)

	cmake-utils_src_configure
}
