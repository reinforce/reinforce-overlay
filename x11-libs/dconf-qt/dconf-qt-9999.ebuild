# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 cmake-utils

DESCRIPTION="Qt and QML bindings for dconf"
HOMEPAGE="git://gitorious.org/dconf-qt"
SRC_URI=""

SLOT="0"
LICENSE="GPLv3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

S="${WORKDIR}/${MY_PN}"
EGIT_REPO_URI="git://gitorious.org/dconf-qt/dconf-qt.git"
EGIT_SOURCEDIR="${S}"

DEPEND="x11-libs/qt-core:4
	x11-libs/qt-gui:4
	x11-libs/qt-declarative:4"

RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	epatch "${FILESDIR}"/qt-internal-fix.patch
}
