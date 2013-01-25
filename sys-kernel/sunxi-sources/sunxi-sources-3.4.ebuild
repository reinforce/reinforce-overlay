# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
ETYPE="sources"

inherit kernel-2 git-2
detect_version
detect_arch

KEYWORDS="~arm ~x86 ~amd64"
HOMEPAGE="http://linux-sunxi.org"
DESCRIPTION="Public Linux Kernel support for the sunxi family (Allwinner A10, A13, ...)"

EGIT_BRANCH="sunxi-${PV}"
EGIT_REPO_URI="git://github.com/linux-sunxi/linux-sunxi.git https://github.com/linux-sunxi/linux-sunxi.git"
