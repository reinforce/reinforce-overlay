# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils bzr qt4-r2

DESCRIPTION="A flexible and cross-platform input method framework"
HOMEPAGE="https://wiki.maliit.org/Main_Page"
SRC_URI=""

SLOT="0"
LICENSE="GPL-3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EBZR_REPO_URI="lp:maliit"
EBZR_PROJECT="maliit"

DEPEND=""

RDEPEND="${DEPEND}"

src_unpack() {
	bzr_src_unpack
}

src_configure() {
	eqmake4 maliit-framework.pro
}
