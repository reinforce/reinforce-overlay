# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2

DESCRIPTION="Sunxi Mali-400 support libraries"
EGIT_REPO_URI="git://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

KEYWORDS="~arm"
IUSE="gles1 gles2"
SLOT="0"

RDEPEND="x11-base/xorg-server
	x11-libs/libdri2"
DEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/makefile.patch
}

src_compile() {
	emake || die
}

src_install() {
	DESTDIR="${D}" install
}
