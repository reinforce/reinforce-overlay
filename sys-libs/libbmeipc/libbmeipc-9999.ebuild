# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="OSS implementation of Maemo5 libbmeipc library"
HOMEPAGE="https://gitorious.org/libbmeipc"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/libbmeipc/libbmeipc.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
}
