# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr autotools

DESCRIPTION="BAMF Application Matching Framework"
HOMEPAGE="https://launchpad.net/bamf"

SLOT="0"
LICENSE="LGPL3"

KEYWORDS=""
IUSE=""

GTKDOCIZE="yes"

EBZR_REPO_URI="lp:bamf"
EBZR_PROJECT="bamf"

DEPEND=">=dev-lang/vala-0.11.7
	dev-util/gtk-doc
	>dev-libs/glib-2.30"

RDEPEND="${DEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

src_prepare() {
	gtkdocize
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
}

