# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="Nokia's Clutter fork with Cordia changes"
HOMEPAGE="https://github.com/Cordia/clutter"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="+X json opengl xinput gtk sdl egl gles1 gles2 pic debug"

EGIT_REPO_URI="https://github.com/Cordia/clutter.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="cssu_tracker"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	gtk? ( x11-libs/gdk-pixbuf )
	json? ( dev-libs/json-glib )
	sdl? ( media-libs/libsdl )
	dev-util/gtk-doc"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myconf="$(use_with X x)
		$(use_enable X xinput)
		$(use_with pic)"

	use json && myconf="${myconf} --with-json=check"
	use debug && myconf="${myconf} --enable-debug=yes"

	if use opengl; then
		myconf="${myconf} --with-flavour=glx"
	elif use sdl; then
		myconf="${myconf} --with-flavour=sdl"
	elif use eglx; then
		myconf="${myconf} --with-flavour=eglx"
	fi

	if use gtk; then
		myconf="${myconf} --with-imagebackend=gdk-pixbuf"
	else
		myconf="${myconf} --with-imagebackend=internal"
	fi

	if use gles1; then
		myconf="${myconf} --with-gles=1.1"
	elif use gles2; then
		myconf="${myconf} --with-gles=2.0"
	fi

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install
}

