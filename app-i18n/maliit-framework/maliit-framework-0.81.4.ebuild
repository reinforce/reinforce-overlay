# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2 gnome2-utils
DESCRIPTION="A flexible and cross platform input method framework"
HOMEPAGE="http://maliit.org"
SRC_URI="http://maliit.org/releases/${PN}/${PF}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+dbus doc examples gtk test"

DEPEND="dbus? ( sys-apps/dbus )
	gtk? ( x11-libs/gtk+ )
	gnome-base/gconf
	>=x11-libs/qt-core-4.7.4:4
	>=x11-libs/qt-gui-4.7.4:4
	>=x11-libs/qt-dbus-4.7.4:4
	>=x11-libs/qt-declarative-4.7.4:4
	>=x11-libs/qt-script-4.7.4:4
	>=x11-libs/qt-sql-4.7.4:4
	>=x11-libs/qt-xmlpatterns-4.7.4:4"

RDEPEND="${DEPEND}"
RESTRICT="test"

DOCS=( README )

src_prepare() {
	epatch ${FILESDIR}/remove-gconf-register.patch
	use !examples && sed -i -e 's/ examples//' maliit-framework.pro
	qt4-r2_src_prepare
}

src_configure() {
	local myconf="nostrip"
	use !dbus && myconf="${myconf} disable-dbus"
	use !doc && myconf="${myconf} nodoc"
	use !gtk && myconf="${myconf} nogtk"
	use !test && myconf="${myconf} notests"
	eqmake4 -r \
		M_IM_PREFIX="${EPREFIX}/usr" \
		M_IM_INSTALL_SCHEMAS="${EPREFIX}/etc/gconf/schemas" \
		CONFIG+="${myconf}"
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install
	dodir /etc/gconf/schemas
	insinto /etc/gconf/schemas
	doins "${S}/src/maliit-framework.schemas"
}

pkg_preinst() {
	gnome2_gconf_savelist
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
