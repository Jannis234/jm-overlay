# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="buffertools:2.1.4"

inherit node-module

DESCRIPTION="JavaScript \"deep equality\" / structural equality tester with Node.js flavor"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
