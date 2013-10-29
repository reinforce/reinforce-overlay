# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2 toolchain-funcs versionator

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/ssvb/${PN}.git"
else
	SRC_URI="https://github.com/ssvb/${PN}/archive/${P}.tar.gz"
fi

DESCRIPTION="Xorg DDX driver for Allwinner A10/A13 and other ARM devices"
KEYWORDS="~arm ~amd64 ~x86"
IUSE="gles"

RDEPEND="x11-base/xorg-server"
DEPEND="${RDEPEND}
	gles? ( x11-drivers/mali-drivers[X] )
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xproto
"
