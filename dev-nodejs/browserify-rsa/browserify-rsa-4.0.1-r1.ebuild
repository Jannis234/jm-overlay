# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="randombytes:2.0.3"
NODE_MODULE_TEST_DEPEND="tape:3.6.1
	parse-asn1:5.0.0"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/bn-js:4.11.3"
DEPEND="${DEPEND}
	test? (
		dev-nodejs/bn-js:4.11.3
		dev-util/tap
	)"

DESCRIPTION="RSA for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )

src_install() {
	node-module_src_install
	install_node_module_depend "bn.js:4.11.3"
}

node_module_run_test() {
	install_node_module_build_depend "bn.js:4.11.3"
	tap test.js || die "Tests failed"
}
