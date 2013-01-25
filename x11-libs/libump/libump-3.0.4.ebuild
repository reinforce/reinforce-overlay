# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit git-2 eutils

DESCRIPTION="Unified Memory Provider userspace API source code needed for xf86-video-mali compilation"
KEYWORDS="~arm"
SLOT="0"

EGIT_REPO_URI="git://github.com/linux-sunxi/libump.git https://github.com/linux-sunxi/libump.git"
EGIT_BRANCH="r3p0-04rel0"
EGIT_COMMIT="914c64ce07b30129c69030facacb52cd1e6197ef"

RDEPEND="x11-libs/libdri2"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/makefile.patch
}
