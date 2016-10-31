# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="inherits:2.0.1
	create-hash:1.1.2"
NODE_MODULE_TEST_DEPEND="tape:3.6.1
	hash-test-vectors:1.3.2"

inherit node-module

DESCRIPTION="Node style hmacs in the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_test() {
	node-module_src_test
	tap test.js || die "Tests failed"
}
