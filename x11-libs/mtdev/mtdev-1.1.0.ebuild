# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Kernel multi-touch transformation library"
SRC_URI="http://launchpad.net/mtdev/trunk/1.1.0/+download/mtdev-1.1.0.tar.gz"
HOMEPAGE="https://launchpad.net/hci/mtdev"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0" 
LICENSE="MIT"
IUSE=""

src_compile() {
	econf
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die

}
