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
KEYWORDS="~amd64 ~x86"
IUSE="X debug"

DEPEND="media-libs/mesa
	x11-libs/qt-core
	x11-libs/qt-gui"

DEPEND="${RDEPEND}"

src_configure() {
	local myconf="
		$(use_with X x)"
	use debug && myconf="${myconf} --enable-debug=yes"

	econf ${myconf} || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install
}

