# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2
DESCRIPTION="Plugins for Maliit Framework"
HOMEPAGE="http://maliit.org"
SRC_URI="http://maliit.org/releases/${PN}/${PF}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc hunspell preedit presage nemo test"

DEPEND="=app-i18n/maliit-framework-${PV}
	>=dev-qt/qtcore-4.7.4:4
	>=dev-qt/qtgui-4.7.4:4
	>=dev-qt/qtdbus-4.7.4:4
	>=dev-qt/qtdeclarative-4.7.4:4
	>=dev-qt/qtscript-4.7.4:4
	>=dev-qt/qtsql-4.7.4:4
	>=dev-qt/qtxmlpatterns-4.7.4:4
	hunspell? ( app-text/hunspell )
	nemo? ( app-i18n/maliit-framework[qml] )
	presage? ( app-text/presage )"

RDEPEND="${DEPEND}"
RESTRICT="test"

DOCS=( README )

src_configure() {
	local myconf=""
	use !doc &&     myconf="${myconf} nodoc"
	use hunspell && myconf="${myconf} enable-hunspell"
	use !test &&    myconf="${myconf} notests"
	use !preedit && myconf="${myconf} disable-preedit"
	use presage &&  myconf="${myconf} enable-presage"
	use !nemo &&    myconf="${myconf} disable-nemo-keyboard"
	eqmake4 -r \
		CONFIG+="${myconf}"
}
