# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="libmatchbox2 contains most of the window manager code and is usually statically linked to hildon-desktop."
HOMEPAGE="http://maemo.gitorious.org/fremantle-hildon-desktop/libmatchbox2"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/fremantle-hildon-desktop/libmatchbox2.git"
EGIT_SOURCEDIR="${S}"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	sys-apps/dbus[X]
	dev-util/gtk-doc
	media-libs/libpng:1.2
	dev-vcs/git"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}
