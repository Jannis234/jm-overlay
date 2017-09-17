# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="chai:3.5.0"

inherit node-module

DESCRIPTION="Shim for require.main.filename() that works in as many environments as possible"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test.js || die "Tests failed"
}
