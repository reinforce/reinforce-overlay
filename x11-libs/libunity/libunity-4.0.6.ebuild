# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="Misc. differently licensed stuff for Unity"
SRC_URI="http://launchpad.net/libunity/4.0/${PV}/+download/libunity-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/libunity"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0" 
LICENSE="LGPL3"
IUSE=""

DEPEND="dev-libs/libgee"

src_install() {
	emake DESTDIR="${D}" install
}

