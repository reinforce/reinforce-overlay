# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Meta package for Shiokaze Desktop Environmen - a light desktop environment for PDA and mobile phones"
HOMEPAGE="http://code.google.com/p/shiokaze/"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~x86 ~amd64 ~arm"

IUSE=""

S="${WORKDIR}"

RDEPEND="
	x11-libs/libsde
	x11-wm/sde-desktop
	x11-wm/sde-applets
	x11-wm/sde-panel
	x11-wm/sde-settings
	x11-wm/sde-picview
	x11-wm/sde-appview
	x11-wm/sde-session"

DEPEND=""
