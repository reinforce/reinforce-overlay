# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"

inherit python

DESCRIPTION="Telepathy-Ring a 3GPP (GSM and 3G UMTS) connection manager for Telepathy framework using oFono."
HOMEPAGE="http://telepathy.freedesktop.org/"
SRC_URI="http://telepathy.freedesktop.org/releases/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

RDEPEND=">=net-misc/ofono-0.47
	>=net-libs/telepathy-glib-0.8.0
	>=dev-libs/glib-2.16
	>=dev-libs/check-0.9.8
	sys-apps/dbus
	dev-libs/dbus-glib"

DEPEND="${RDEPEND}
	dev-libs/libxslt
	test? ( dev-python/twisted )"

pkg_setup() {
	python_set_active_version 2
}

src_prepare() {
	python_convert_shebangs -r 2 .
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README
}
