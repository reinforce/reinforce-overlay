# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/twisted/twisted-11.1.0.ebuild,v 1.3 2011/12/29 04:17:11 floppym Exp $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit eutils distutils

DESCRIPTION="Python for Windows extensions"
SRC_URI="http://downloads.sourceforge.net/project/pywin32/pywin32/Build%20217/pywin32-${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/WMI-${PV}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}
