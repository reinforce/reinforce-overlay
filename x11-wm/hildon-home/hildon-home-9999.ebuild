# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="hildon-home application loads Home applets, hildon-desktop backgrounds, implements Notification D-Bus service etc."
HOMEPAGE="https://github.com/Cordia/hildon-home"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="https://github.com/Cordia/hildon-home.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="cssu_tracker"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	media-libs/clutter:0.8
	media-libs/libosso
	x11-libs/gtk+
	x11-libs/libhildon
	x11-libs/libhildondesktop
	x11-libs/libmatchbox2
	sys-apps/dbus[X]"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}
