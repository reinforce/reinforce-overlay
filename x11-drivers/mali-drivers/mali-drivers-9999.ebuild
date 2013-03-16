# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2

DESCRIPTION="Sunxi Mali-400 support libraries"
EGIT_REPO_URI="git://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

KEYWORDS="~arm"
IUSE=""
SLOT="0"

RDEPEND="x11-base/xorg-server
	x11-libs/libdri2"
DEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/makefile.patch
}

src_compile() {
	emake || die
}

src_install() {
	local opengl_imp="mali"
	local opengl_dir="/usr/$(get_libdir)/opengl/${opengl_imp}"

	into "${opengl_dir}"
	dolib.so libEGL.so.1
	dolib.so libGLESv1_CM.so.1
	dolib.so libGLESv2.so.2

	into "/usr/$(get_libdir)"
	dolib.so libMali.so
	dolib.so libUMP.so.3
	dolib.so libUMP.so

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
