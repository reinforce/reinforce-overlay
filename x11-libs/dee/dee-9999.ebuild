# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit bzr eutils autotools

DESCRIPTION="Model to synchronize mutiple instances over DBus"
HOMEPAGE="https://launchpad.net/dee"

SLOT="0"
LICENSE="GPLv3"

KEYWORDS=""
IUSE=""

EBZR_REPO_URI="lp:dee"
EBZR_PROJECT="dee"

RDEPEND="sys-apps/dbus
	dev-lang/python"

DEPEND="${RDEPEND}"

src_unpack() { 
	bzr_src_unpack 
}

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
}

