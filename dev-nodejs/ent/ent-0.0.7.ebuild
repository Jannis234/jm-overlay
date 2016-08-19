# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:1.0.4"
NODE_MODULE_EXTRA_FILES="entities.json"

inherit node-module

DESCRIPTION="Encode and decode HTML entities"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test examples"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"
DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}

src_test() {
	node-module_src_test
	tap test || die "Tests failed"
}
