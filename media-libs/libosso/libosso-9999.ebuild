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
IUSE=""

EGIT_REPO_URI="https://git.gitorious.org/fremantle-hildon-desktop/libosso.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND=""

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}
