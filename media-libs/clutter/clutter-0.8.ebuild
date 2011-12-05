# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Clutter version used in Fremantle"
HOMEPAGE="http://maemo.gitorious.org/fremantle-hildon-desktop/clutter_0_8"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="-maemo-gtk"

EGIT_REPO_URI="git://gitorious.org/fremantle-hildon-desktop/clutter_0_8.git"
EGIT_SOURCEDIR="${S}"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	dev-util/gtk-doc
	dev-vcs/git"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}