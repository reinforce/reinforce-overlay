# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/u-boot-tools/u-boot-tools-2010.06.ebuild,v 1.4 2011/03/07 11:33:22 armin76 Exp $

EAPI=3

inherit base git-2 eutils

DESCRIPTION="Utilities for working with Das U-Boot on Nokia N900"
HOMEPAGE="http://www.denx.de/wiki/U-Boot/WebHome"

EGIT_REPO_URI="git://git.denx.de/u-boot.git"
EGIT_COMMIT="bd2313078114c4b44c4a5ce149af43bcb7fc8854"

SRC_URI=""
S=${WORKDIR}/${PN}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/0001-Reduce-delays-in-omap-i2c-driver.patch
	epatch "${FILESDIR}"/0002-Make-bootm-optionally-use-pre-existing-atags-for-Lin.patch
	epatch "${FILESDIR}"/0003-Store-existing-atags-at-startup-if-chainloading.patch
	epatch "${FILESDIR}"/0004-Nokia-RX-51-aka-N900-support.patch
	epatch "${FILESDIR}"/0005-ext2-fix.patch
}

src_configure()
{
	return
}

src_compile()
{
	return
}

src_install() {
	dodir /usr/src
	cp -a "${S}" "${D}"/usr/src/"${PN}" || die
}

pkg_postinst() {
	elog "${PN} sources is now installed in /usr/src/${PN}"
}
