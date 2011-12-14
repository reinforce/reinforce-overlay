# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils cmake-utils

DESCRIPTION="Misc. differently licensed stuff for Unity"
HOMEPAGE="https://launchpad.net/unity-misc"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:unity-misc"
EBZR_PROJECT="unity-misc"

DEPEND=""

RDEPEND="${DEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

src_install() {
	emake DESTDIR="${D}" install
}

