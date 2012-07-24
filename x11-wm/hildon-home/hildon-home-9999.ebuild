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
IUSE="+X pic debug maemo"

EGIT_REPO_URI="https://github.com/Cordia/hildon-home.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="cssu_tracker"

RDEPEND="media-libs/clutter
	media-libs/libosso
	x11-libs/gtk+
	x11-libs/libhildon
	x11-libs/libhildondesktop
	x11-libs/libmatchbox2
	dev-db/sqlite:3
	X? ( x11-libs/libX11 )"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
	epatch "${FILESDIR}"/hildon-home.patch
}

src_configure() {
	local myconf="$(use_with pic)
		$(use_with X x)
		$(use_enable debug)
		$(use_enable maemo-launcher)"

	econf ${myconf}
}


src_install() {
	emake DESTDIR="${D}" install
}
