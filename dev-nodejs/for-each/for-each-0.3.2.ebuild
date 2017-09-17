# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="is-function:1.0.1"
NODE_MODULE_TEST_DEPEND="tape:1.1.2"

inherit node-module

DESCRIPTION="A better forEach"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md )

node_module_run_test() {
	tap test || die "Tests failed"
}
