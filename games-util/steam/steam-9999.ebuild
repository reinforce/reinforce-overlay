# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit unpacker

DESCRIPTION="Client for Valve Software's Steam content delivery program"
HOMEPAGE="http://www.steampowered.com/"

if [[ "${PV}" == "9999" ]] ; then
	SRC_URI="http://repo.steampowered.com/steam/archive/precise/steam_latest.deb"
	KEYWORDS=""
else
	SRC_URI="http://repo.steampowered.com/steam/archive/precise/steam_${PV}_i386.deb"
	KEYWORDS="-* ~amd64 ~x86"
fi

LICENSE="ValveSteamLicense"

RESTRICT="bindist mirror"
SLOT="0"
IUSE="pulseaudio"

DEPEND=""
RDEPEND="virtual/opengl
	x86? (
		x11-libs/libXext
		>=x11-libs/libX11-1.5
		media-libs/libsdl
		media-libs/libtheora
		media-libs/libvorbis
		media-libs/alsa-lib
		media-libs/libogg
		x11-libs/gtk+:2
		media-libs/openal
		>=x11-libs/pixman-0.24.4
		x11-libs/cairo
		dev-libs/libgcrypt
		net-misc/curl
		x11-libs/gdk-pixbuf
		dev-libs/nspr
		dev-libs/nss
		x11-libs/pango
		media-libs/libpng:1.2
		>=sys-libs/glibc-2.15
		>=sys-libs/zlib-1.2.4
		media-libs/libjpeg-turbo
		>=sys-devel/gcc-4.6
		net-print/cups
	)
	amd64? (
		>=app-emulation/emul-linux-x86-baselibs-20121028
		>=app-emulation/emul-linux-x86-gtklibs-20121028
		>=app-emulation/emul-linux-x86-opengl-20121028
		>=app-emulation/emul-linux-x86-sdl-20120520
		>=app-emulation/emul-linux-x86-soundlibs-20121028
		>=app-emulation/emul-linux-x86-xlibs-20121028
		>=sys-libs/glibc-2.15[multilib]
		>=sys-devel/gcc-4.6[multilib]
	)
	media-libs/fontconfig
	media-libs/freetype:2
	pulseaudio? ( media-sound/pulseaudio )
	sys-apps/dbus"

src_unpack() {
	unpack_deb ${A}
	mkdir ${P}
	mv usr ${P}/usr
	rm debian-binary
	rm control.tar.gz
	rm data.tar.gz
}

src_prepare() {
	# fix QA notice
	sed -r -i "s/^(MimeType=.*)/\1;/" usr/share/applications/steam.desktop
	sed -r -i "s/^(Actions=.*)/\1;/" usr/share/applications/steam.desktop
}

src_install(){
	dobin "usr/bin/steam"
	dodir "usr/"
	cp -r "usr/share/" "${D}/usr/" || die "Install failed!"
	cp -r "usr/lib" "${D}/usr/" || die "Install failed!"
}
