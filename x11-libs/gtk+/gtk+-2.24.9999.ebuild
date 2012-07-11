# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/gtk+/gtk+-2.24.10-r1.ebuild,v 1.12 2012/06/03 12:48:54 jlec Exp $

EAPI="4"

inherit eutils flag-o-matic virtualx autotools git-2
#inherit eutils flag-o-matic gnome.org virtualx autotools


DESCRIPTION="Gimp ToolKit +"
HOMEPAGE="http://www.gtk.org/"

EGIT_REPO_URI="https://github.com/Cordia/gtk.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="2-24"

LICENSE="LGPL-2"
SLOT="2"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ~mips ppc ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="aqua cups debug doc examples +introspection test vim-syntax xinerama"

# NOTE: cairo[svg] dep is due to bug 291283 (not patched to avoid eautoreconf)
COMMON_DEPEND="!aqua? (
		x11-libs/libXrender
		x11-libs/libX11
		x11-libs/libXi
		x11-libs/libXt
		x11-libs/libXext
		>=x11-libs/libXrandr-1.3
		x11-libs/libXcursor
		x11-libs/libXfixes
		x11-libs/libXcomposite
		x11-libs/libXdamage
		>=x11-libs/cairo-1.6[X,svg]
		x11-libs/gdk-pixbuf:2[X,introspection?]
	)
	aqua? (
		>=x11-libs/cairo-1.6[aqua,svg]
		x11-libs/gdk-pixbuf:2[introspection?]
	)
	xinerama? ( x11-libs/libXinerama )
	>=dev-libs/glib-2.27.3:2
	>=x11-libs/pango-1.20[introspection?]
	>=dev-libs/atk-1.29.2[introspection?]
	media-libs/fontconfig
	x11-misc/shared-mime-info
	cups? ( net-print/cups )
	introspection? ( >=dev-libs/gobject-introspection-0.9.3 )
	!<gnome-base/gail-1000"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	!aqua? (
		x11-proto/xextproto
		x11-proto/xproto
		x11-proto/inputproto
		x11-proto/damageproto
	)
	xinerama? ( x11-proto/xineramaproto )
	>=dev-util/gtk-doc-am-1.11
	doc? (
		>=dev-util/gtk-doc-1.11
		~app-text/docbook-xml-dtd-4.1.2 )
	test? (
		media-fonts/font-misc-misc
		media-fonts/font-cursor-misc )"
# gtk+-2.24.8 breaks Alt key handling in <=x11-libs/vte-0.28.2:0
# Remove blocker after >=vte-0.28.2-r201:0 is stable
RDEPEND="${COMMON_DEPEND}
	!<x11-libs/vte-0.28.2-r201:0"
PDEPEND="vim-syntax? ( app-vim/gtk-syntax )"

src_prepare() {
        eautoreconf
}

src_configure() {
	local myconf="$(use_enable doc gtk-doc)
		$(use_enable xinerama)
		$(use_enable cups cups auto)
		$(use_enable introspection)
		--disable-papi"
	if use aqua; then
		myconf="${myconf} --with-gdktarget=quartz"
	else
		myconf="${myconf} --with-gdktarget=x11 --with-xinput"
	fi

	# Passing --disable-debug is not recommended for production use
	use debug && myconf="${myconf} --enable-debug=yes"

	econf ${myconf}
}

src_test() {
	unset DBUS_SESSION_BUS_ADDRESS
	# Exporting HOME fixes tests using XDG directories spec since all defaults
	# are based on $HOME. It is also backward compatible with functions not
	# yet ported to this spec.
	XDG_DATA_HOME="${T}" HOME="${T}" Xemake check || die "tests failed"
}

src_install() {
	emake DESTDIR="${D}" install

#	set_gtk2_confdir
	dodir ${GTK2_CONFDIR}
	keepdir ${GTK2_CONFDIR}

	# see bug #133241
	echo 'gtk-fallback-icon-theme = "gnome"' > "${T}/gtkrc"
	insinto /etc/gtk-2.0
	doins "${T}"/gtkrc

	# Enable xft in environment as suggested by <utx@gentoo.org>
	echo "GDK_USE_XFT=1" > "${T}"/50gtk2
	doenvd "${T}"/50gtk2

	dodoc AUTHORS ChangeLog* HACKING NEWS* README*

	# add -framework Carbon to the .pc files
	use aqua && for i in gtk+-2.0.pc gtk+-quartz-2.0.pc gtk+-unix-print-2.0.pc; do
		sed -i -e "s:Libs\: :Libs\: -framework Carbon :" "${ED%/}"/usr/lib/pkgconfig/$i || die "sed failed"
	done

	# dev-util/gtk-builder-convert split off into a separate package, #402905
	rm "${ED}"usr/bin/gtk-builder-convert

	find "${D}" -name '*.la' -exec rm -f {} +
}

