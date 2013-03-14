# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib

DESCRIPTION="Symlinks for closed source userspace drivers for Mali 3D graphics accelerator"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND=">=app-admin/eselect-opengl-1.2.6"
RDEPEND="${DEPEND} media-libs/mesa[gles1,gles2]
	x11-libs/mali-libs"

RESTRICT="test"

pkg_setup() {
	# expect the real libMali.so blob in /usr/lib/ directory
	if [ ! -e /usr/lib/libMali.so ] ; then
		einfo
		einfo "Please obtain the libMali.so library (with DRI2/X11 support enabled)"
		einfo "from your silicon vendor and put it into /usr/lib/libMali.so"
		einfo "before emerging this package."
		einfo
		einfo "    http://forums.arm.com/index.php?/topic/16259-how-can-i-upgrade-mali-device-driver/page__p__39744#entry39744"
		einfo
		einfo "If the Mali binary drivers get a clear license, which explicitly"
		einfo "allows redistribution, then this ebuild can be updated to make"
		einfo "the installation process easier. Thanks for your patience"
		einfo "and understanding."
		einfo
		die
	fi
}

src_compile() {
	# build shared library stubs with the right sonames
	gcc -shared -Wl,-soname,libEGL.so.1 -o libEGL.so.1 \
		-L/usr/lib -lMali || die
	gcc -shared -Wl,-soname,libGLESv1_CM.so.1 -o libGLESv1_CM.so.1 \
		-L/usr/lib -lMali || die
	gcc -shared -Wl,-soname,libGLESv2.so.2 -o libGLESv2.so.2 \
		-L/usr/lib -lMali || die
}

src_install() {
	local opengl_imp="mali"
	local opengl_dir="/usr/$(get_libdir)/opengl/${opengl_imp}"

	into "${opengl_dir}"
	dolib.so libEGL.so.1
	dolib.so libGLESv1_CM.so.1
	dolib.so libGLESv2.so.2

	# symlink for libMali.so
	dosym "/usr/lib/libMali.so" "/usr/$(get_libdir)/libMali.so"

	# make the symlinks for EGL/GLES stuff
	dosym "${opengl_dir}/lib/libEGL.so.1" "${opengl_dir}/lib/libEGL.so"
	dosym "${opengl_dir}/lib/libGLESv1_CM.so.1" "${opengl_dir}/lib/libGLESv1_CM.so"
	dosym "${opengl_dir}/lib/libGLESv2.so.2" "${opengl_dir}/lib/libGLESv2.so"

	# fallback to mesa for libGL.so
	dosym "/usr/$(get_libdir)/opengl/xorg-x11/lib/libGL.so" "${opengl_dir}/lib/libGL.so"
	dosym "/usr/$(get_libdir)/opengl/xorg-x11/lib/libGL.so.1" "${opengl_dir}/lib/libGL.so.1"

	# udev rules to get the right ownership/permission for /dev/ump and /dev/mali
	insinto /lib/udev/rules.d
	doins "${FILESDIR}"/99-mali-drivers.rules
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
