# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2
DESCRIPTION="A flexible and cross platform input method framework"
HOMEPAGE="https://github.com/maliit"
SRC_URI="https://github.com/maliit/framework/archive/${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+dbus doc examples +gtk qml qdbus test wayland"

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

PATCHES=( "${FILESDIR}/${PN}-0.94.0-removeldconfig.patch" )

DOCS=( README )

src_prepare() {
	use !examples && sed -i -e 's/SUBDIRS += examples//' maliit-framework.pro
	qt4-r2_src_prepare
}

S="${WORKDIR}/framework-${PV}"

src_configure() {
	local myconf="disable-gtk-cache-update"
	use dbus &&     myconf="${myconf} enable-dbus-activation"
	use !dbus &&    myconf="${myconf} disable-dbus"
	use !doc &&     myconf="${myconf} nodoc"
	use !gtk &&     myconf="${myconf} nogtk"
	use !qml &&     myconf="${myconf} noqml"
	use qdbus &&    myconf="${myconf} enable-qdbus"
	use !test &&    myconf="${myconf} notests"
	use wayland &&  myconf="${myconf} wayland"
	eqmake4 -r \
		CONFIG+="${myconf}"
}
