# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils cmake-utils

DESCRIPTION="Qt bindings for GConf"
HOMEPAGE="https://launchpad.net/gconf-qt"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:gconf-qt"
EBZR_PROJECT="gconf-qt"

RDEPEND="x11-libs/qt-declarative"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

