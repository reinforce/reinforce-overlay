# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Nokia's Clutter fork with Cordia changes"
HOMEPAGE="https://github.com/Cordia/clutter"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="-maemo-gtk"

EGIT_REPO_URI="https://github.com/Cordia/clutter.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="cssu_tracker"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	dev-util/gtk-doc"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}
