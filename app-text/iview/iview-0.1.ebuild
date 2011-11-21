# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils qt4-r2

DESCRIPTION="A tiny document viewer written in Qt."
HOMEPAGE="https://github.com/bazhenovc/iview"
SRC_URI=""

SLOT="0"
LICENSE="GPL-3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

S="${WORKDIR}/${MY_PN}"
SRC_URI="https://github.com/downloads/bazhenovc/${PN}/${P}.tar.gz"

DEPEND="x11-libs/qt-core:4
	x11-libs/qt-gui:4
	app-text/poppler[qt4]"

RDEPEND="${DEPEND}"

src_configure() {
	eqmake4 iview.pro
}
src_install() {
	into /usr
	dobin iview || die
}
