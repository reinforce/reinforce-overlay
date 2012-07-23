# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2

DESCRIPTION="Development files for mce"
HOMEPAGE="https://git.gitorious.org/meego-middleware/mce-dev"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="https://git.gitorious.org/meego-middleware/mce-dev.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND=""
DEPEND="${RDEPEND}"

src_compile() {
	elog "Nothing to compile, just install headers"
}

src_install() {
	emake DESTDIR="${D}" install
}

