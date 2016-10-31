# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="base64-js:0.0.8
	ieee754:1.1.6
	isarray:1.0.0"
NODE_MODULE_TEST_DEPEND="tape:4.6.2
	is-nan:1.2.1"

inherit node-module

DESCRIPTION="Node.js Buffer API, for the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test || die "Tests failed"
}
