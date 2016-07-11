# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=SRI
MODULE_VERSION=6.57
MODULE_EXAMPLES=("examples/*")
inherit perl-module

DESCRIPTION="Real-time web framework"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test minimal"

RDEPEND="
	!minimal? (
		dev-perl/EV
	)
	virtual/perl-IO-Socket-IP
	virtual/perl-JSON-PP
	virtual/perl-Pod-Simple
	virtual/perl-Time-Local
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test-Simple
	)
"

src_test() {
	perl_rm_files t/pod{,_coverage}.t
	perl-module_src_test
}
