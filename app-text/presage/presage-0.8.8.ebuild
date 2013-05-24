# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils autotools
DESCRIPTION="The intelligent predictive text entry system"
HOMEPAGE="http://http://presage.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc examples gtk python sqlite test"

RDEPEND="
	examples? ( sys-libs/ncurses )
	gtk? ( x11-libs/gtk+ )
	python? ( dev-lang/python dev-python/dbus-python )
	sqlite? ( dev-db/sqlite )
	app-text/unix2dos
"

DEPEND="${COMMON_DEPEND}
	doc? ( app-doc/doxygen )
	python? ( dev-lang/swig )
	test? ( dev-util/cppunit )
	sys-apps/help2man
"

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.8.8-automagic.patch"
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable doc documentation)
		$(use_enable gtk gpresagemate)
		$(use_enable gtk gprompter)
		$(use_enable examples curses)
		$(use_enable python)
		$(use_enable python python-binding)
		$(use_enable sqlite)
		$(use_enable test)
	)
	econf ${myeconfargs}
}
