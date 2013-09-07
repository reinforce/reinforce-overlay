# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit git-2 autotools

EGIT_REPO_URI="https://github.com/willswang/libcedarx.git"

DESCRIPTION="CedarX is Allwinner's multimedia co-processing technology for hardware accelerated video and image decoding, as used inside their A10 SoC's and others."
KEYWORDS="~arm"
IUSE=""
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}
