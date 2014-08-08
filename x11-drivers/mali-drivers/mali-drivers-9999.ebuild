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

OPENGL_IMP="mali"
OPENGL_DIR="usr/$(get_libdir)/opengl/${OPENGL_IMP}"

src_unpack() {
	git-2_src_unpack
}

src_compile() {
	if use X; then
		EGL_TYPE="x11"
	else
		EGL_TYPE="framebuffer"
	fi
	emake ABI=armhf EGL_TYPE=${EGL_TYPE} || die
}

src_install() {
	# Create dirs
	dodir ${OPENGL_DIR}/{lib,extensions,include}

	# Install
	base_src_install

	# Move libs and headers from /usr to /usr/lib/opengl/mali
	# because user can eselect desired GL provider.
	ebegin "Moving libs and headers for dynamic switching"
		local x
		for x in "${ED}"/usr/$(get_libdir)/lib{EGL,GL*}.{la,a,so*}; do
			if [ -f ${x} -o -L ${x} ]; then
				mv -f "${x}" "${ED}/${OPENGL_DIR}"/lib \
					|| die "Failed to move ${x}"
			fi
		done
		for x in "${ED}"/usr/include/{EGL,GLES*,KHR}; do
			if [ -d ${x} ]; then
				mv -f "${x}" "${ED}/${OPENGL_DIR}"/include \
					|| die "Failed to move ${x}"
			fi
		done
	eend $?

	# Make the symlinks for libMali.so
	dosym "../../../libMali.so" "${OPENGL_DIR}/lib/libMali.so"

	# Fallback to mesa for libGL.so
	dosym "../../xorg-x11/lib/libGL.so" "${OPENGL_DIR}/lib/libGL.so"
	dosym "../../xorg-x11/lib/libGL.so.1" "${OPENGL_DIR}/lib/libGL.so.1"

	# Udev rules to get the right ownership/permission for /dev/ump and /dev/mali
	udev_newrules "${FILESDIR}"/99-mali-drivers.rules 99-mali-drivers.rules
}

pkg_postinst() {
	elog "You must be in the video group to use the Mali 3D acceleration."
	elog "To use the Mali OpenGL ES libraries, run \"eselect opengl set ${OPENGL_IMP}\""
}
