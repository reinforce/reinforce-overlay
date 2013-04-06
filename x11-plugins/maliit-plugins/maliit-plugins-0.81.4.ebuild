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
IUSE="doc gtk test"

DEPEND="x11-misc/maliit-framework
	gtk? ( x11-misc/maliit-framework[gtk] )"

RDEPEND="${DEPEND}"
RESTRICT="test"

DOCS=( README )

src_configure() {
	local myconf="nostrip"
	use !doc && myconf="${myconf} nodoc"
	use !gtk && myconf="${myconf} nogtk"
	use !test && myconf="${myconf} notests"
	qmake PREFIX="${EPREFIX}/usr" CONFIG+="${myconf}"
}
