# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit eutils git-2 autotools

DESCRIPTION="libmatchbox2 with Cordia changes"
HOMEPAGE="https://github.com/Cordia/libmatchbox2"

SLOT="0"
LICENSE="GPLv2"

KEYWORDS="~x86 ~amd64 ~arm"
IUSE="pic gtk doc pango png"

EGIT_REPO_URI="https://github.com/Cordia/libmatchbox2.git"
EGIT_SOURCEDIR="${S}"
EGIT_BRANCH="clutter_0_8"

RDEPEND="media-libs/clutter
        dev-util/gtk-doc-am
        doc? (
		dev-util/gtk-doc
		app-text/docbook-xml-dtd )
	gtk? ( x11-libs/gtk+ )
	pango? ( x11-libs/pango )"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
	epatch "${FILESDIR}"/XKeycodeToKeysym.patch
}

src_configure() {
        local myconf="$(use_enable doc gtk-doc)
		$(use_enable debug)
		$(use_with pic)
		$(use_with gtk)
		$(use_with pango)
		$(use_enable png png-theme)"

	econf ${myconf}
}
		


src_install() {
	emake DESTDIR="${D}" install
}

