# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="seed.js"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:0.2.2"

inherit node-module

DESCRIPTION="A requirable version of Date.now()"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test || die "Tests failed"
}
