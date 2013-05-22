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
IUSE="+dbus doc examples gtk qml test wayland"

DEPEND="dbus? ( sys-apps/dbus )
	gtk? ( x11-libs/gtk+ )
	gnome-base/gconf
	>=dev-qt/qtcore-4.7.4:4
	>=dev-qt/qtgui-4.7.4:4
	>=dev-qt/qtdbus-4.7.4:4
	>=dev-qt/qtdeclarative-4.7.4:4
	>=dev-qt/qtscript-4.7.4:4
	>=dev-qt/qtsql-4.7.4:4
	>=dev-qt/qtxmlpatterns-4.7.4:4
	wayland? ( dev-libs/wayland )"

RDEPEND="${DEPEND}"
RESTRICT="test"

DOCS=( README )

src_prepare() {
	use !examples && sed -i -e 's/ examples//' maliit-framework.pro
	qt4-r2_src_prepare
}

src_configure() {
	local myconf="disable-gtk-cache-update nostrip"
	if use dbus; then
		myconf="${myconf} enable-dbus-activation"
	else
		myconf="${myconf} disable-dbus"
	fi
	use !doc && myconf="${myconf} nodoc"
	use !gtk && myconf="${myconf} nogtk"
	use !qml && myconf="${myconf} noqml"
	use !test && myconf="${myconf} notests"
	use wayland && myconf="${myconf} wayland"
	eqmake4 -r \
		CONFIG+="${myconf}"
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install
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
