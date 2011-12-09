# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXi/libXi-1.4.3.ebuild,v 1.1 2011/06/07 14:14:01 chithanh Exp $

EAPI=4

XORG_DOC=doc
inherit xorg-2

DESCRIPTION="X.Org Xi library"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE="utouch"

RDEPEND=">=x11-libs/libX11-1.3
	>=x11-libs/libXext-1.1
	>=x11-proto/inputproto-2.0
	>=x11-proto/xproto-7.0.13
	>=x11-proto/xextproto-7.0.3"
DEPEND="${RDEPEND}"

src_prepare() {
	if use utouch ; then
		epatch "${FILESDIR}/libXi-xi2.1.patch"
	fi
	xorg-2_src_prepare
}


pkg_setup() {
	xorg-2_pkg_setup
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable doc specs)
		$(use_with doc xmlto)
		$(use_with doc asciidoc)
		--without-fop
	)
}

pkg_postinst() {
	xorg-2_pkg_postinst

	ewarn "Some special keys and keyboard layouts may stop working."
	ewarn "To fix them, recompile xorg-server."
}
