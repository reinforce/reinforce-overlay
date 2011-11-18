# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Hildon Desktop is the primary UI component of Hildon"
HOMEPAGE="https://gitorious.org/cordia"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/cordia/hildon-desktop.git"
EGIT_SOURCEDIR="${S}"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	x11-libs/gtk+
	x11-libs/libhildonfm
	x11-libs/libmatchbox2
	media-libs/clutter"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

