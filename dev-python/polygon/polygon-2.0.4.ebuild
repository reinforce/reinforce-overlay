# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"

inherit distutils eutils

DESCRIPTION="Polygon is a python package that handles polygonal shapes in 2D. "
HOMEPAGE="http://www.j-raedler.de/projects/polygon/"
SRC_URI="https://github.com/downloads/jraedler/Polygon2/Polygon-${PV}.zip"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/visual
	dev-python/setuptools"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Polygon-${PV}"
