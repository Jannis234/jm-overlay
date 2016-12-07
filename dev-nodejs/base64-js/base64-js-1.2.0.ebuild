# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:4.6.3"
NODE_MODULE_EXTRA_FILES="base64js.min.js"

inherit node-module

DESCRIPTION="Base64 encoding/decoding in pure JS"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md )

node_module_run_test() {
	tap test || die "Tests failed"
}
