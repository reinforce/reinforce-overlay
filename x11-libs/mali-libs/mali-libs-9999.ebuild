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

RDEPEND="x11-base/xorg-server"
DEPEND="${RDEPEND}
	gles1? ( x11-drivers/mali-drivers )
	gles2? ( x11-drivers/mali-drivers )
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xproto
"

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
