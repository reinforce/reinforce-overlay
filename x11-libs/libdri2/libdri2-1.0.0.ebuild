# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools eutils git-2

DESCRIPTION="libdri2 - library for the DRI2 extension to the X Window System"
KEYWORDS="~arm ~x86 ~amd64"
SLOT="0"

EGIT_REPO_URI="git://github.com/robclark/libdri2.git https://github.com/robclark/libdri2.git"
EGIT_BRANCH="master"
EGIT_COMMIT="4f1eef3183df2b270c3d5cbef07343ee5127a6a4"

RDEPEND=">=x11-misc/util-macros-1.8"
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

