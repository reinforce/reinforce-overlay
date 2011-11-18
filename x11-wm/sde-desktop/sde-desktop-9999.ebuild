# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils cmake-utils mercurial

DESCRIPTION="Desktop for Shiokaze Desktop Environment"
HOMEPAGE="http://code.google.com/p/shiokaze/"

SLOT="0"
LICENSE="GPL-3"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

EHG_PROJECT="shiokaze"
EHG_REPO_URI="https://shiokaze.googlecode.com/hg"
S="${WORKDIR}/hg"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	sys-apps/dbus[X]
	dev-vcs/mercurial"

DEPEND="${RDEPEND}
	dev-util/cmake
	x11-libs/libsde"

src_unpack() {
	mercurial_src_unpack
	S="${S}/trunk/desktop" # �������...
}
