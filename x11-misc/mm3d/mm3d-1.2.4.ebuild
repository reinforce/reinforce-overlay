# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

MY_PN="misfitmodel3d"

DESCRIPTION="Misfit Model 3D is a 3D modeling and animation program"
HOMEPAGE="http://www.misfitcode.com/misfitmodel3d/"
SRC_URI="mirror://sourceforge/${MY_PN}/${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug lua"

DEPEND="x11-libs/qt-core[qt3support]
	x11-libs/qt-opengl[qt3support]
	virtual/glut
	lua? ( dev-lang/lua )"

src_unpack() {
	unpack ${A} || die "unpack failed"

	cd ${S}

	# Fix hard-coded path of HTML docs
	sed -i -e "/DOC_ROOT.*PREFIX/s/${PN}/${PF}/" \
		src/libmm3d/mm3dconfig.h \
		|| die "sed mm3dconfig.h"
}

src_configure() {
	local myconf
	use debug && myconf="${myconf} --with-enable-debug"

	econf ${myconf} || die "econf failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "make install failed"

	# make install put html docs in /usr/share/doc/mm3d, so we'll fix this issue
	mv ${D}/usr/share/doc/${PN} ${D}/usr/share/doc/${PF}

	dodoc AUTHORS ChangeLog NEWS README TODO INSTALL || die "dodoc failed"
}
