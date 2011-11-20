# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 qt4-r2

DESCRIPTION="A tiny document viewer written in Qt."
HOMEPAGE="https://github.com/bazhenovc/iview"

SLOT="0"
LICENSE="GPL-3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="https://github.com/bazhenovc/iview.git"
EGIT_SOURCEDIR="${S}"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt"

DEPEND="${RDEPEND}
	x11-libs/qt-core:4
	x11-libs/qt-gui:4
	app-text/poppler[qt4]
	x11-proto/xextproto
	x11-proto/xproto"

src_configure() {
	eqmake4 "${S}"/iview.pro
}
