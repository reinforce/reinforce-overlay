# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools

DESCRIPTION="Misc. differently licensed stuff for Unity"
SRC_URI="http://launchpad.net/libunity-misc/trunk/${PV}/+download/libunity-misc-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/bamf"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0" 
LICENSE="LGPL3"
IUSE=""

DEPEND=""

src_install() {
	emake DESTDIR="${D}" install
}
