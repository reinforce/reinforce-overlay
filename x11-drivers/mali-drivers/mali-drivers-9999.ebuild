# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2 udev

DESCRIPTION="Sunxi Mali-400 support libraries"
EGIT_REPO_URI="git://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

KEYWORDS="~arm"
IUSE="X directfb"
REQUIRED_USE="
	X? ( !directfb )
	directfb? ( !X )"

SLOT="0"

RDEPEND="x11-base/xorg-server
	x11-libs/libdri2"
DEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/Gentoo-armhf-ABI.patch
	sed -i 's/prefix ?= \/usr\//prefix ?= \//' Makefile.setup
}

src_compile() {
	use X && EGL_TYPE="x11"
	use directfb && EGL_TYPE="framebuffer"
	emake EGL_TYPE=${EGL_TYPE} || die
}

src_install() {
	local opengl_imp="mali"
	local opengl_dir="/usr/$(get_libdir)/opengl/${opengl_imp}"

	mkdir ${D}/${opengl_dir}/lib -p
	mkdir ${D}/${opengl_dir}/include/ump -p

	# install to opengl dir
	emake DESTDIR="${D}/${opengl_dir}" prefix=/ install

	# make the symlinks for Mali and UMP stuff
	dosym "opengl/${opengl_imp}/lib/libMali.so" "/usr/$(get_libdir)/libMali.so"
	dosym "opengl/${opengl_imp}/lib/libUMP.so" "/usr/$(get_libdir)/libUMP.so"

	# fallback to mesa for libGL.so
	dosym "../../xorg-x11/lib/libGL.so" "${opengl_dir}/lib/libGL.so"
	dosym "../../xorg-x11/lib/libGL.so.1" "${opengl_dir}/lib/libGL.so.1"

	# udev rules to get the right ownership/permission for /dev/ump and /dev/mali
	udev_newrules "${FILESDIR}"/99-mali-drivers.rules 99-mali-drivers.rules
}

pkg_postinst() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old mali

	elog "You must be in the video group to use the Mali 3D acceleration."
	elog
	elog "To use the Mali OpenGL ES libraries, run \"eselect opengl set mali\""
}

pkg_postrm() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old xorg-x11
}
