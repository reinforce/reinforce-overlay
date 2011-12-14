# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="Dee"
SRC_URI="http://launchpad.net/dee/0.5/${PV}/+download/dee-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/dee"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0" 
LICENSE="LGPL3"
IUSE=""

DEPEND="dev-libs/libgee"

src_install() {
	emake DESTDIR="${D}" install
}

