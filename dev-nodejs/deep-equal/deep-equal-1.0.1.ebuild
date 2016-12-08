# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:3.6.1"

inherit node-module

DESCRIPTION="Node's assert.deepEqual algorithm"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	tap test || die "Tests failed"
}
