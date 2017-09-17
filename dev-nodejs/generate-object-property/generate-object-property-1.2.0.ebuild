# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="is-property:1.0.2"
NODE_MODULE_TEST_DEPEND="tape:2.14.1"

inherit node-module

DESCRIPTION="Generate safe JS code that can used to reference a object property"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test.js || die "Tests failed"
}
