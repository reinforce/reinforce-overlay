# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base eutils git-2 multilib udev

DESCRIPTION="Sunxi Mali-400 support libraries"
HOMEPAGE="https://github.com/linux-sunxi/sunxi-mali"

EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

LICENSE=""
SLOT="0"
KEYWORDS="~arm"
IUSE="X"

RDEPEND="x11-base/xorg-server
	x11-libs/libdri2
	x11-libs/libump"
DEPEND="${RDEPEND}"

RESTRICT="strip"

#src_unpack() {
#	git-2_src_unpack
#}

src_configure() {
	if use X; then
		emake config ABI=armhf EGL_TYPE=x11 || die
	else
		emake config ABI=armhf EGL_TYPE=framebuffer || die
	fi
}

src_install() {
	local opengl_imp=mali
	local opengl_dir=/usr/$(get_libdir)/opengl/${opengl_imp}/

	# Create dirs
	dodir ${opengl_dir}/{lib,extensions,include}

	# Install
	emake DESTDIR="${D}" prefix="${opengl_dir}" install

	# Fallback to mesa for libGL.so
	dosym "../../xorg-x11/lib/libGL.so" "${opengl_dir}/lib/libGL.so"
	dosym "../../xorg-x11/lib/libGL.so.1" "${opengl_dir}/lib/libGL.so.1"

	# Udev rules to get the right ownership/permission for /dev/ump and /dev/mali
	udev_newrules "${FILESDIR}"/99-mali-drivers.rules 99-mali-drivers.rules
}

pkg_postinst() {
	elog "You must be in the video group to use the Mali 3D acceleration."
	elog "To use the Mali OpenGL ES libraries, run \"eselect opengl set mali\""
}
