# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="util:0.10.3"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Commonjs assert - node.js api compatible"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

DOCS=( README.md )

node_module_run_test() {
	mocha --ui qunit test.js || die "Tests failed"
}
