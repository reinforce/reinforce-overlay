# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit multilib

DESCRIPTION="Pepper Flash plugin from ChromeOS for use in Chromium"
HOMEPAGE="https://www.google.com/chrome"
SRC_URI="http://mirror.archlinuxarm.org/armv7h/alarm/chromium-${PF}-1-armv7h.pkg.tar.xz"

IUSE=""
SLOT="0"
KEYWORDS="~arm"
LICENSE="google-chrome"
RESTRICT="bindist mirror strip"

S="${WORKDIR}"

src_install() {
	insinto /usr/$(get_libdir)/chromium-browser/PepperFlash
	doins usr/lib/PepperFlash/libpepflashplayer.so

	version="${PV}"
	flapper="${ROOT}usr/$(get_libdir)/chromium-browser/PepperFlash/libpepflashplayer.so"
	echo -n "CHROMIUM_FLAGS=\"\${CHROMIUM_FLAGS} " > pepper-flash
	echo -n "--ppapi-flash-path=$flapper " >> pepper-flash
	echo "--ppapi-flash-version=$version\"" >> pepper-flash

	insinto /etc/chromium/
	doins pepper-flash
}
