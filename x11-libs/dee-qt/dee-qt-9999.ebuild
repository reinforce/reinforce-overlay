# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils cmake-utils

DESCRIPTION="Qt bindings for libdee"
HOMEPAGE="https://launchpad.net/dee-qt"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:dee-qt"
EBZR_PROJECT="dee-qt"

RDEPEND="x11-libs/dee
	x11-libs/qt-declarative
	x11-libs/qt-dbus"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

