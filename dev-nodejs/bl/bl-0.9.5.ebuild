# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="readable-stream:1.0.34"
NODE_MODULE_TEST_DEPEND="tape:4.6.0
	hash_file:0.1.1"

inherit node-module

DESCRIPTION="Buffer List: Collect buffers, access with a standard readable Buffer interface"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md )

node_module_run_test() {
	# Uses an external service, but the (empty) file needs to stay here for the other tests
	echo > test/sauce.js || die
	sed -i "s/\/tmp\///g" test/*.js || die # Fix sandbox violation
	tap test || die "Tests failed"
}
