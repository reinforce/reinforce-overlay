# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools eutils git-2

DESCRIPTION="MALI video driver"
KEYWORDS="~arm"
SLOT="0"

EGIT_REPO_URI="git://github.com/linux-sunxi/xf86-video-mali.git https://github.com/linux-sunxi/xf86-video-mali.git"
EGIT_BRANCH="r3p0-04rel0"
EGIT_COMMIT="762d8454614b8eb8d4cd4692e123e8fcbde6c0f2"

RDEPEND=">=x11-base/xorg-server-1.3
	>=x11-misc/util-macros-1.8
	x11-libs/libump"

DEPEND="${RDEPEND}"

src_unpack() {
        git-2_src_unpack
}

src_prepare() {
        eautoreconf
}

src_compile() {
        emake || die
}

src_install() {
        emake DESTDIR="${D}" install || die
}

