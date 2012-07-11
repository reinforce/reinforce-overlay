# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="The hildon library"
HOMEPAGE="https://github.com/Cordia/libhildon"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="-maemo-gtk"

EGIT_REPO_URI="https://github.com/Cordia/libhildon.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="gtk_3"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	x11-libs/gtk+:3
	media-libs/libcanberra
	sys-apps/dbus[X]
	dev-util/gtk-doc"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
	sed -i -e '/^#pragma GCC diagnostic push/d' hildon/hildon-touch-selector-entry.c || die
	sed -i -e '/^#pragma GCC diagnostic ignored "-Wuninitialized"/d' hildon/hildon-touch-selector-entry.c || die
	sed -i -e '/^#pragma GCC diagnostic pop/d' hildon/hildon-touch-selector-entry.c || die
}