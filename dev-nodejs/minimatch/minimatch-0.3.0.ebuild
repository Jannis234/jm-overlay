# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="sigmund:1.0.1
	lru-cache:2.7.3"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="A glob matcher in javascript"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

RESTRICT="test" # Broken

DOCS=( README.md )

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
