# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Event Emulation for the uTouch Stack"
SRC_URI="http://launchpad.net/utouch-evemu/trunk/utouch-evemu-${PV}/+download/utouch-evemu-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/utouch-evemu"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0" 
LICENSE="GPL-3"
IUSE=""

src_compile() {
	econf
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die

}
