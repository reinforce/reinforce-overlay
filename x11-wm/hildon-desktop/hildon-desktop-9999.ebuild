# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Hildon desktop, the window manager, application launcher and switcher program."
HOMEPAGE="http://maemo.gitorious.org/fremantle-hildon-desktop"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/fremantle-hildon-desktop/hildon-desktop.git"
EGIT_SOURCEDIR="${S}"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	media-libs/clutter
	x11-libs/hildon
	x11-libs/libhildondesktop
	x11-libs/libmatchbox2
	sys-apps/dbus[X]
	dev-vcs/git"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

