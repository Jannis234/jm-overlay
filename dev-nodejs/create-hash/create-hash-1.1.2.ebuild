# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js helpers.js md5.js"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="cipher-base:1.0.2
	inherits:2.0.1
	ripemd160:1.0.1"
NODE_MODULE_TEST_DEPEND="tape:3.6.1
	hash-test-vectors:1.3.2"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/sha-js:2.4.5"
DEPEND="${DEPEND}
	test? (
		dev-nodejs/sha-js:2.4.5
		dev-util/tap:0
	)"

DESCRIPTION="Create hashes for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )

src_install() {
	node-module_src_install
	install_node_module_depend "sha.js:2.4.5"
}

src_test() {
	node-module_src_test
	install_node_module_build_depend "sha.js:2.4.5"
	tap test.js || die "Tests failed"
}
