# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base

DESCRIPTION="Gesture Recognition And Instantiation Library"
SRC_URI="http://launchpad.net/utouch-grail/trunk/v${PV}/+download/utouch-grail-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/utouch-grail"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0"
LICENSE="GPV-3"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-libs/mtdev
	x11-libs/utouch-evemu
	x11-libs/utouch-frame"

