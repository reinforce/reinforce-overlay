# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils autotools

DESCRIPTION="Touch Frame Library"
HOMEPAGE="https://launchpad.net/utouch-frame"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EBZR_REPO_URI="lp:utouch-frame"
EBZR_PROJECT="utouch-frame"

RDEPEND="x11-libs/mtdev"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

src_prepare() {
	eautoreconf
}
