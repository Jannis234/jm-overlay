# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="falafel:1.2.0
	through:2.3.8"

inherit node-module

DESCRIPTION="Utilities for writing browserify transforms"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/coffee-script"
DOCS=( README.md CHANGELOG.md )

src_compile() {
	coffee -c -o lib src || die
}
