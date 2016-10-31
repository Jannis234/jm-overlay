# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="inherits:2.0.1"
NODE_MODULE_TEST_DEPEND="tape:4.6.2"

inherit node-module

DESCRIPTION="Abstract base class for crypto-streams"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test.js || die "Tests failed"
}
