# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="base64-js:1.2.0
	ieee754:1.1.8
	isarray:1.0.0"
NODE_MODULE_TEST_DEPEND="tape:4.6.3
	is-nan:1.2.1
	is-buffer:1.1.4"

inherit node-module

DESCRIPTION="Node.js Buffer API, for the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test/*.js || die "Tests failed"
}
