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
	# udev rules to get the right ownership/permission for /dev/ump and /dev/mali
	insinto /lib/udev/rules.d
	doins "${FILESDIR}"/99-mali-drivers.rules

	mkdir ${D}/usr/lib -p
	mkdir #{D}/usr/include/ump -p

	emake DESTDIR="${D}" install
}
