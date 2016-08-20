# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit node-module

DEPEND="dev-lang/coffee-script"

DESCRIPTION="Higher-order functions for easier error handling"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_compile() {
	coffee -c index.coffee || die
}
