# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="diff:1.4.0
	escape-string-regexp:1.0.5
	color-support:1.1.1
	debug:2.2.0
	readable-stream:1.1.14
	tap-parser:1.3.2
	glob:7.0.5
	js-yaml:3.6.1
	unicode-length:1.0.1"

inherit node-module

DESCRIPTION="Format a TAP stream using Mocha's set of reporters"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md )

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
