# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Primary UI component of Hildon"
HOMEPAGE="https://github.com/Cordia/hildon-desktop"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="pic maemo"

EGIT_REPO_URI="https://github.com/Cordia/hildon-desktop.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="cssu_tracker"

RDEPEND="x11-libs/gtk+
	x11-libs/libhildon
	x11-libs/libhildondesktop
	x11-libs/libmatchbox2
	media-libs/clutter
	gnome-base/gnome-vfs
	gnome-base/gnome-menus
	gnome-base/gconf
	dev-libs/dbus-glib"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
	epatch "${FILESDIR}"/maemo_changes.patch
}

src_configure() {
	local myconf="$(use_with pic)
		$(use_enable maemo maemo-launcher)"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
}

