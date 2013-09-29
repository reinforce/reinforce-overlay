# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit base eutils git-2 udev

DESCRIPTION="Sunxi Mali-400 support libraries"
EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

KEYWORDS="~arm"
IUSE="X"
SLOT="0"

RDEPEND="x11-base/xorg-server
	x11-libs/libdri2"
DEPEND="${RDEPEND}"

OPENGL_IMP="mali"
OPENGL_DIR="/usr/$(get_libdir)/opengl/${OPENGL_IMP}"

src_unpack() {
	git-2_src_unpack
}

src_compile() {
	if use X; then
		EGL_TYPE="x11"
	else
		EGL_TYPE="framebuffer"
	fi
	emake EGL_TYPE=${EGL_TYPE} || die
}

src_install() {
	# Create dirs
	dodir usr/$(get_libdir)
	dodir usr/include/ump

	# Install
	base_src_install

	# Move libMali and others from /usr/lib to /usr/lib/opengl/mali/lib
	# because user can eselect desired GL provider.
	ebegin "Moving libMali and friends for dynamic switching"
		local x
		dodir ${OPENGL_DIR}/{lib,extensions,include}
		for x in "${ED}"/usr/$(get_libdir)/lib{EGL,GL*,Mali,UMP}.{la,a,so*}; do
			if [ -f ${x} -o -L ${x} ]; then
				mv -f "${x}" "${ED}${OPENGL_DIR}"/lib \
					|| die "Failed to move ${x}"
			fi
		done
		for x in "${ED}"/usr/include/{EGL,GLES*,KHR}; do
			if [ -d ${x} ]; then
				mv -f "${x}" "${ED}${OPENGL_DIR}"/include \
					|| die "Failed to move ${x}"
			fi
		done
	eend $?

	# Make the symlinks for libMali.so and libUMP.so
	dosym "opengl/${OPENGL_IMP}/lib/libMali.so" "/usr/$(get_libdir)/libMali.so"
	dosym "opengl/${OPENGL_IMP}/lib/libUMP.so" "/usr/$(get_libdir)/libUMP.so"

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
