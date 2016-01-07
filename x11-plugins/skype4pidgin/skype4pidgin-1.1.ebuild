# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/EionRobb/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/EionRobb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Skype (HTTP) API Plugin for Pidgin"
HOMEPAGE="http://eion.robbmob.com/"
LICENSE="GPL-2"
IUSE=""
SLOT="0"

RDEPEND="net-im/pidgin"

DEPEND="
	${RDEPEND}
	>dev-libs/glib-2.0
	>dev-libs/json-glib-1.0"

S="${S}/skypeweb"
