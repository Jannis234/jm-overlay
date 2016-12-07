# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="shim.js"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:4.6.3"

inherit node-module

DESCRIPTION="Memoize the results of the path.relative function"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( Readme.md History.md )

src_compile() { :; }

node_module_run_test() {
	tap test || die "Tests failed"
}
