# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod

DESCRIPTION="EPRD is an eventually persistant ramdisk or diskcache"
HOMEPAGE="http://www.lessfs.com"
SRC_URI="http://downloads.sourceforge.net/project/eprd/${P}/${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug"

RDEPEND=""

BUILD_TARGETS="modules"

pkg_setup() {
	MODULE_NAMES="eprd(misc:${S})"
	linux-mod_pkg_setup
	BUILD_PARAMS="-C ${KV_DIR} SUBDIRS=${S}"
}

src_install() {
	linux-mod_src_install

	dobin eprd_setup
	dodoc README
}
