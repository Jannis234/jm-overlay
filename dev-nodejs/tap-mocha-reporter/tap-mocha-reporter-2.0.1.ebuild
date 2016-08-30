# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="diff:1.4.0
	escape-string-regexp:1.0.5
	color-support:1.1.1
	debug:2.2.0
	readable-stream:2.1.5
	tap-parser:2.0.0
	glob:7.0.6
	js-yaml:3.6.1
	unicode-length:1.0.3"

inherit node-module

DESCRIPTION="Format a TAP stream using Mocha's set of reporters"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md )

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
