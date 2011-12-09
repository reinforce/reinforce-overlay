# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils autotools

DESCRIPTION="Gesture Recognition And Instantiation Library"
HOMEPAGE="https://launchpad.net/utouch-grail"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:utouch-grail"
EBZR_PROJECT="utouch-grail"

RDEPEND=""

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
}

