# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:1.0.4"

inherit node-module

DESCRIPTION="Traverse and transform objects by visiting every node on a recursive walk"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test examples"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}

src_test() {
	node-module_src_test
	tap test/*.js || die "Tests failed"
}
