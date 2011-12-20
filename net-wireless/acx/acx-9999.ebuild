# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2

DESCRIPTION="Driver for the ACX100 and ACX111 wireless chipset"
HOMEPAGE="http://acx100.sourceforge.net"

LICENSE="GPL-2 as-is"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

EGIT_REPO_URI="git://acx100.git.sourceforge.net/gitroot/acx100/acx-mac80211"
EGIT_SOURCEDIR="${S}"

RDEPEND="net-wireless/wireless-tools"

CONFIG_CHECK="WIRELESS FW_LOADER"
BUILD_TARGETS="modules"

src_unpack() {
	git-2_src_unpack
}

src_configure() {
	sed -i 's/CONFIG_ACX_MAC80211_PCI=y/CONFIG_ACX_MAC80211_PCI=n/' Makefile
	sed -i 's/CONFIG_ACX_MAC80211_USB=y/CONFIG_ACX_MAC80211_USB=n/' Makefile
	sed -i 's/CONFIG_ACX_MAC80211_MEM=n/CONFIG_ACX_MAC80211_MEM=y/' Makefile
}

src_compile() {
	emake || die
	cd platform-hx4700
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	cd platform-hx4700
	emake DESTDIR="${D}" install || die
}

pkg_pkg_postinst() {
	ewarn
	ewarn "Note: You need to manualy copy firmware(RADIO0d.BIN, RADIO11.BIN and WLANGEN.BIN) into /lib/firmware"
	ewarn
}
