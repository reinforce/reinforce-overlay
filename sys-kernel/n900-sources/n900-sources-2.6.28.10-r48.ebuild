# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: n900-power-sources-2.6.28.10-power48.ebuild $

EAPI="2"
ETYPE="sources"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~arm ~x86 ~amd64"
HOMEPAGE="http://maemo.org/packages/view/kernel-power-source/"

DESCRIPTION="Full sources for Nokia N900 including some patches for Gentoo"
SRC_URI="http://rin.nnov.ru/distfiles/kernel-power-source.tar.bz2"

src_unpack() {
	unpack ${A}
	cd kernel-power-source
	epatch "${FILESDIR}"/0001-fix-DCC-console-for-v7.patch
	cd ..
	epatch "${FILESDIR}"/0002-dsp-bridge-dynload-cload.patch
	epatch "${FILESDIR}"/0003-gpu-pvr-make.patch
	epatch "${FILESDIR}"/0004-make.patch
	mv kernel-power-source linux-2.6.28.10-n900-r48
}

pkg_postinst() {
	kernel-2_pkg_postinst
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
