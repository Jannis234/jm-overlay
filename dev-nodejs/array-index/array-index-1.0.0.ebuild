# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="debug:2.2.0
	es6-symbol:3.1.0"

inherit node-module

DESCRIPTION="Invoke getter/setter functions on array-like objects"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md History.md )

src_compile() { :; }

src_test() {
	node-module_src_test
	node test.js || die "Tests failed"
}
