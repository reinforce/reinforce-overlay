# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="TabletWM is a minimalistic Window Manager, oriented to tablet PCs and devices with small screens"
HOMEPAGE="http://www.rastersoft.com/programas/tabletwm.html"

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/rastersoft/tabletwm.git"
else
	SRC_URI="https://github.com/rastersoft/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="x11-libs/cairo[xcb]
	x11-libs/libxkbcommon"
DEPEND="${RDEPEND}"

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install || die "Install failed"
	dodoc README.md || die
}
