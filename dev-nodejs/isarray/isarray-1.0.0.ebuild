# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:2.13.4"

inherit node-module

DESCRIPTION="Array#isArray for older browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_compile() { :; }

node_module_run_test() {
	tap test.js || die "Tests failed"
}
