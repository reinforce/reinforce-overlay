# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit git-2

DESCRIPTION="Lima is a free software graphics driver for the ARM Mali GPUs."
EGIT_REPO_URI="https://gitorious.org/lima/lima.git"

KEYWORDS="~arm"
LICENSE="GPLv2" 
SLOT="0"
IUSE=""

DEPEND=">=app-admin/eselect-opengl-1.2.6"
RDEPEND="${DEPEND} media-libs/mesa[gles1,gles2]
	x11-drivers/mali-drivers"

src_configure() {
	sed -i 's/arm-linux-gnueabihf/armv7a-hardfloat-linux-gnueabi/' Makefile.inc
	sed -i 's/arm-linux-gnueabi/armv7a-softfloat-linux-gnueabi/' Makefile.inc
}

src_install() {
	insinto "/usr/bin"
	dobin "tools/compile/mali_compile"
	dobin "tools/info/mali_info"

	insinto "/usr/lib"
	dolib.so "limare/lib/liblimare.so"
	dolib.so "wrap/libMali_wrap.so"
}
