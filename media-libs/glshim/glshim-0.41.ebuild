# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils multilib

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/lunixbochs/glshim.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/lunixbochs/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm"
fi

HOMEPAGE="https://github.com/lunixbochs/glshim"
DESCRIPTION="Runtime translation from GL 1.x to GL ES 1.x"

LICENSE="MIT"
SLOT="0"
IUSE="mali"

RDEPEND="virtual/opengl
	>=media-libs/mesa-9[egl,gles1,gles2]
	mali? ( x11-drivers/mali-drivers )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=( 
		"-DCMAKE_INSTALL_PREFIX=/usr/$(get_libdir)/opengl/glshim"
	)
	cmake-utils_src_configure	
}

src_install() {
	cmake-utils_src_install

	# Set local variables
	local opengl_imp="glshim"
	local opengl_dir="/usr/$(get_libdir)/opengl/${opengl_imp}"
	local gles_imp="xorg-x11"
	use mali && local gles_imp="mali"

	# Create dirs
	dodir ${opengl_dir}/{extensions,include}

	# Copy headers
	local x
	for x in "${WORKDIR}/${P}"/include/{EGL,GL,GLES,KHR}; do
		if [ -d ${x} ]; then
			cp -a "${x}" "${ED}/${opengl_dir}"/include \
				|| die "Failed to copy headers ${x}"
		fi
	done

	# Make symlinks
	dosym "libEGL.so.1" "${opengl_dir}/lib/libEGL.so"
	dosym "../../${gles_imp}/lib/libEGL.so.1" "${opengl_dir}/lib/libEGL.so.1"

	dosym "libGLESv1_CM.so.1" "${opengl_dir}/lib/libGLESv1_CM.so"
	dosym "../../${gles_imp}/lib/libGLESv1_CM.so.1" "${opengl_dir}/lib/libGLESv1_CM.so.1"

	dosym "libGLESv2.so.2" "${opengl_dir}/lib/libGLESv2.so"
	dosym "../../${gles_imp}/lib/libGLESv2.so.2" "${opengl_dir}/lib/libGLESv2.so.2"
}
