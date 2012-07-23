# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION=""
HOMEPAGE="http://maemo.gitorious.org/fremantle-hildon-desktop/libosso"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="pic debug"

EGIT_REPO_URI="https://git.gitorious.org/fremantle-hildon-desktop/libosso.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND="sys-apps/dbus
	app-misc/mce"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myconf="$(use_with pic)
		$(use_enable debug)"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
}
