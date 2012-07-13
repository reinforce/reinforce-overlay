# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Hildon-Desktop support library"
HOMEPAGE="https://github.com/Cordia/libhildondesktop"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="https://github.com/Cordia/libhildondesktop.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND="x11-libs/libhildon
	sys-libs/libiphb"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
}

