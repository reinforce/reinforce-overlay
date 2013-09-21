# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2

DESCRIPTION="Experimental VDPAU implementation for sunxi SoCs."
HOMEPAGE="https://github.com/linux-sunxi/libvdpau-sunxi"

EGIT_REPO_URI="https://github.com/linux-sunxi/libvdpau-sunxi.git"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DOCS="README"

RDEPEND="x11-libs/libX11
	x11-libs/libvdpau
	x11-drivers/mali-drivers"

DEPEND="${RDEPEND}"
