# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="acorn:1.2.2"
NODE_MODULE_TEST_DEPEND="tape:2.4.1
	escodegen:0.0.17"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Walk the ast with references to parent nodes"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test examples"

DOCS=( readme.markdown )

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

src_test() {
	node-module_src_test
	tap test || die "Tests failed"
}
