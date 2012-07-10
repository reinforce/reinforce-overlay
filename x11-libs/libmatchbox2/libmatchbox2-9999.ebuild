# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="libmatchbox2 with Cordia changes"
HOMEPAGE="https://github.com/Cordia/libmatchbox2"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="https://github.com/Cordia/libmatchbox2.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="clutter_0_8"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	media-libs/clutter:0.8
	sys-apps/dbus[X]
	dev-util/gtk-doc"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}
