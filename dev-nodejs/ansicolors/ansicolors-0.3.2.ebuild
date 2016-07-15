# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Functions that surround a string with ansicolor codes so it prints in color"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_test() {
	node-module_src_test
	node test/ansicolors.js || die "Tests failed"
}
