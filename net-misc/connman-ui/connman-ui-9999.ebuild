# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 autotools

DESCRIPTION="A full-featured GTK based trayicon UI for ConnMan"
HOMEPAGE="https://github.com/tbursztyka/connman-ui"
EGIT_REPO_URI="git://github.com/tbursztyka/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="net-misc/connman
	>=sys-apps/dbus-1.4
	>=dev-libs/glib-2.28
	x11-libs/gtk+:3"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
