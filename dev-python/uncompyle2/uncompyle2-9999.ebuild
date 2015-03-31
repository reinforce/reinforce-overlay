# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

DESCRIPTION="A Python 2.5, 2.6, 2.7 byte-code decompiler, written in Python 2.7"
HOMEPAGE="https://github.com/Mysterie/uncompyle2"
EGIT_REPO_URI="https://github.com/Mysterie/uncompyle2.git"

IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
