# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2

DESCRIPTION="The Mode Control Entity for Nokia Internet Tablets"
HOMEPAGE="http://meego.gitorious.org/meego-middleware/mce"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/meego-middleware/mce.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="master"

RDEPEND="app-doc/doxygen
	app-misc/mce-dev
	sys-libs/libdsme
	sys-kernel/linux-headers"

DEPEND="${RDEPEND}"

src_prepare() {
	sed -i -e '/WARNINGS += -Werror/d' Makefile || die
}

src_install() {
	emake DESTDIR="${D}" install
}

