# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="readable-stream:1.1.14"
NODE_MODULE_TEST_DEPEND="chai:1.7.2"

inherit node-module

DESCRIPTION="Like duplexer but using streams2"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc example.js
}

node_module_run_test() {
	mocha test || die "Tests failed"
}
