# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
ETYPE="sources"

inherit kernel-2 git-2 versionator
detect_version
detect_arch

KEYWORDS=""
HOMEPAGE="http://linux-sunxi.org"
DESCRIPTION="Linux source for Allwinner/Boxchip F20 (sun3i), A10 (sun4i), A12/A13/A10S (sun5i) and A20 (sun7i) SoCs"

MY_PV=$(get_version_component_range 1-2)

EGIT_BRANCH="sunxi-${MY_PV}"
EGIT_REPO_URI="https://github.com/linux-sunxi/linux-sunxi.git"
