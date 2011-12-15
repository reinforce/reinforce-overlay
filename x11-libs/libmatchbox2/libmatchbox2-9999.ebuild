# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Matchbox 2 Window Manager library"
HOMEPAGE="http://gitorious.org/qildon/libmatchbox2"

SLOT="0"
LICENSE="LGPL"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/qildon/libmatchbox2.git"
EGIT_SOURCEDIR="${S}"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	media-libs/libpng:1.2"

DEPEND="${RDEPEND}"

src_prepare() {
	sed -i 's/clutter-0.8/clutter-1.0/' configure.ac
	sed -i 's/libpng12/libpng/' configure.ac
	eautoreconf
}
