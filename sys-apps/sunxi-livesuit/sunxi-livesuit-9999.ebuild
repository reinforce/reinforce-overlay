# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2 linux-mod udev

DESCRIPTION="LiveSuit is a tool to flash Images to the NAND of Allwinner devices"
HOMEPAGE="http://linux-sunxi.org/LiveSuit"
EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-livesuite.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="bindist strip"

RDEPEND="virtual/libusb"
DEPEND="${RDEPEND}"

BUILD_TARGETS="modules"

pkg_setup() {
	MODULE_NAMES="awusb(misc:${S}/awusb)"
	linux-mod_pkg_setup
	BUILD_PARAMS="-C ${KV_DIR} SUBDIRS=${S}/awusb"
}

src_install() {
	linux-mod_src_install

	dodir /opt/LiveSuit
	if use amd64; then
		cp -R "${S}/x86-64" "${D}/opt/LiveSuit" || die "Install failed!"
	elif use x86; then
		cp -R "${S}/x86" "${D}/opt/LiveSuit" || die "Install failed!"
	fi

	exeinto /opt/bin
	doexe ${FILESDIR}/LiveSuit

	udev_newrules ${FILESDIR}/50-awusb.rules 50-awusb.rules

	dodoc README
}
