# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 qt4-r2

DESCRIPTION="Qildon widgets set"
HOMEPAGE="https://gitorious.org/qildon"
SRC_URI=""

SLOT="0"
LICENSE="GPL-3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

S="${WORKDIR}/${MY_PN}"
EGIT_REPO_URI="git://gitorious.org/qildon/qildon.git"
EGIT_SOURCEDIR="${S}"

DEPEND="x11-libs/qt-core:4
	x11-libs/qt-gui:4
	app-text/poppler[qt4]"

RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_configure() {
	eqmake4 qildon.pro
}
