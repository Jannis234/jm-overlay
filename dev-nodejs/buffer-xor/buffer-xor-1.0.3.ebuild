# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="inline.js inplace.js"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="A simple module for bitwise-xor on buffers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

node_module_run_test() {
	mocha || die "Tests failed"
}
