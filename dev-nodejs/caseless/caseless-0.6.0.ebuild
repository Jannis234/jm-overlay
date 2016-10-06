# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:2.14.1"

inherit node-module

DESCRIPTION="Caseless object set/get/has, very useful when working with HTTP headers"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_test() {
	node-module_src_test
	tap test.js || die "Tests failed"
}
