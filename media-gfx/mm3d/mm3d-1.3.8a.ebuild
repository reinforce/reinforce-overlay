# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/feh/feh-1.12.ebuild,v 1.8 2011/04/11 16:25:13 xarthisius Exp $

EAPI=2
inherit eutils

DESCRIPTION="Misfit Model 3D is an OpenGL-based 3D model editor that works with triangle-based models"
HOMEPAGE="http://www.misfitcode.com/misfitmodel3d/"
SRC_URI="http://citylan.dl.sourceforge.net/project/misfitmodel3d/misfitmodel3d-devel/mm3d-1.3.8/${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X debug"

RDEPEND="media-libs/mesa
	x11-libs/qt-core
	x11-libs/qt-gui"

DEPEND="${RDEPEND}"

src_configure() {
	local myconf="
		$(use_with X x)"
	use debug && myconf="${myconf} --enable-debug=yes"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
}

