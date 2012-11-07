# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit rpm

DESCRIPTION="simplified/streamlined version of wine with commercial support"
HOMEPAGE="http://www.codeweavers.com/products"
SRC_URI="crossover-11.3.1-1.i386.rpm"

LICENSE="CROSSOVER"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="fetch strip"

RDEPEND="sys-libs/glibc
	x11-libs/libXrandr
	x11-libs/libXi
	x11-libs/libXmu
	x11-libs/libXxf86dga
	x11-libs/libXxf86vm
	dev-util/desktop-file-utils
	amd64? ( app-emulation/emul-linux-x86-xlibs )
	media-libs/jpeg:62
	media-libs/libpng:1.2"

pkg_nofetch() {
	einfo "Please visit ${HOMEPAGE}"
	einfo "and place ${A} in ${DISTDIR}"
}

src_unpack() {
	rpm_unpack ${A}
}

src_install() {
	cp -r * "${D}" || die "cp failed"
	rm -r "${D}"/opt/cxoffice/{changelog.txt,license.txt,README}
}

pkg_postinst() {
	elog "Run /opt/cxoffice/bin/cxsetup as normal user to create"
	elog "bottles and install Windows applications."
}
