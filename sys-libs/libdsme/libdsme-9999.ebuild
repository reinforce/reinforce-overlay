# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit git-2 eutils

DESCRIPTION="Libdsme is the IPC library of dsme"
HOMEPAGE="http://meego.gitorious.org/meego-middleware/libdsme"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/meego-middleware/libdsme.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND="sys-libs/libbmeipc"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install
}

