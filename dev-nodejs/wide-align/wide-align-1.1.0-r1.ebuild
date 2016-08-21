# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_EXTRA_FILES="align.js"
NODE_MODULE_DEPEND="string-width:1.0.2"

inherit node-module

DESCRIPTION="A wide-character aware text alignment function"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"
DOCS=( README.md )

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	sed -i "/x         /d" test/*.js || die # Remove broken tests
	tap test || die "Tests failed"
}
