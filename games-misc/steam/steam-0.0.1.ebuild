# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit unpacker

DESCRIPTION="Client for Valve Software's Steam content delivery program"
HOMEPAGE="http://www.steampowered.com/"
SRC_URI="steam.deb"

LICENSE="steam"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="fetch strip"

RDEPEND="sys-libs/glibc
	sys-apps/dbus
	x11-libs/libXrandr
	x11-libs/libXi
	x11-libs/libXfixes
	x11-libs/libXext
	x11-libs/libX11
	>=x11-libs/pixman-0.24.4
	>=x11-libs/cairo-1.6.0
	>=x11-libs/pango-1.22.0
	>=x11-libs/gdk-pixbuf-2.22.0
	>=x11-libs/gtk+-2.24.0
	>=net-misc/curl-7.16
	>=net-print/cups-1.4.0
	>=media-libs/libogg-1.0
	>=media-libs/libsdl-1.2.10
	>=media-libs/libtheora-1.0
	>=media-libs/libvorbis-1.1.2
	>=media-libs/alsa-lib-1.0.23
	>=media-libs/fontconfig-0.8.0
	>=media-libs/freetype-2.3.9
	>=media-libs/openal-1.13
	media-libs/libjpeg-turbo
	media-libs/libpng:1.2
	>=media-sound/pulseaudio-0.99.1
	>=dev-libs/glib-2.14.0
	>=dev-libs/libgcrypt-1.4.5
	>=dev-libs/nspr-1.8.0.10
	>=dev-libs/nss-3.12.3
	sys-libs/libstdc++-v3
	sys-libs/zlib
	dev-libs/libappindicator
	amd64? ( app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-gtklibs
		app-emulation/emul-linux-x86-compat
		app-emulation/emul-linux-x86-sdl
		app-emulation/emul-linux-x86-opengl
		app-emulation/emul-linux-x86-soundlibs )"

pkg_nofetch() {
	einfo "Please visit ${HOMEPAGE}"
	einfo "and place ${A} in ${DISTDIR}"
}

src_unpack() {
	unpack ${A}
	tar xf ${WORKDIR}/data.tar.gz || die "Unpack failed!"
	rm ${WORKDIR}/debian-binary
	rm ${WORKDIR}/control.tar.gz
	rm ${WORKDIR}/data.tar.gz
}

src_install(){
	dobin "usr/bin/steam"
	dodir "usr/"
	cp -r "usr/share/" "${D}/usr/" || die "Install failed!"
	cp -r "usr/lib" "${D}/usr/" || die "Install failed!"
}
