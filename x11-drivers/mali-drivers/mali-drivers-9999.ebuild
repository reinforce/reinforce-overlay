# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2 udev

DESCRIPTION="Sunxi Mali-400 support libraries"
EGIT_REPO_URI="git://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

KEYWORDS="~arm"
IUSE="X"
SLOT="0"

RDEPEND="x11-base/xorg-server
	x11-libs/libdri2"
DEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/Gentoo-armhf-ABI.patch
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
	local opengl_imp="mali"
	local opengl_dir="usr/$(get_libdir)/opengl/${opengl_imp}"

	mkdir ${D}/usr/${get_libdir} -p
	mkdir ${D}/usr/include/ump -p
	mkdir ${D}/${opengl_dir}/lib -p
	mkdir ${D}/${opengl_dir}/include -p

	# install to opengl dir
	emake DESTDIR="${D}" install

	# move libs and headers to opengl_dir
	mv ${D}/usr/$(get_libdir)/lib*.so* ${D}/${opengl_dir}/lib
	mv ${D}/usr/include/{EGL,KHR,GLES,GLES2} ${D}/${opengl_dir}/include

	# make the symlinks for libMali.so and libUMP.so
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

	elog
	elog "You must be in the video group to use the Mali 3D acceleration."
	elog
	elog "To use the Mali OpenGL ES libraries, run \"eselect opengl set mali\""
	elog
}

pkg_postrm() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old xorg-x11
}
