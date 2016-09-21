# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_EXTRA_FILES="base64.js base64-vlq.js"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="source-map:0.1.43"

inherit node-module

DESCRIPTION="Parses out base64 VLQ encoded mappings"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test examples"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
