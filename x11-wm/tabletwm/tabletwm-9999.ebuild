# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2

DESCRIPTION="TabletWM is a minimalistic Window Manager, oriented to tablet PCs and devices with small screens"
HOMEPAGE="http://www.rastersoft.com/programas/tabletwm.html"

EGIT_REPO_URI="https://github.com/rastersoft/tabletwm.git"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND="x11-libs/cairo[xcb]"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_prepare() {
	epatch "${FILESDIR}"/Makefile.patch
}
