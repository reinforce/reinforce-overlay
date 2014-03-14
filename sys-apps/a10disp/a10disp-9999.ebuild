# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/hglm/${PN}.git"
	SRC_URI="https://raw.github.com/linux-sunxi/linux-sunxi/sunxi-3.4/include/video/sunxi_disp_ioctl.h"
	KEYWORDS=""
else
	SRC_URI="https://github.com/hglm/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		https://raw.github.com/linux-sunxi/linux-sunxi/sunxi-3.4/include/video/sunxi_disp_ioctl.h"
	KEYWORDS="~arm"
fi

DESCRIPTION="Program to the change the display mode of Allwinner devices running linux-sunxi."
HOMEPAGE="https://github.com/hglm/a10disp"
SLOT="0"
IUSE=""

RDEPEND="sys-apps/fbset"
DEPEND="${RDEPEND}"

src_prepare() {
	cp "${DISTDIR}/sunxi_disp_ioctl.h" "${S}/sunxi_disp_ioctl.h"
}

src_install() {
	dobin a10disp
}
