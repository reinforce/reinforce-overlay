# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="An experimental (restricted) Python-to-C++ compiler"
HOMEPAGE="http://code.google.com/p/shedskin/"
SRC_URI="http://shedskin.googlecode.com/files/${P}.tgz"

LICENSE="GPLv3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT_PYTHON_ABIS="3.*"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}
