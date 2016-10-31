# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bplistParser.js"
NODE_MODULE_DEPEND="big-integer:1.6.15"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Binary plist parser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/nodeunit )"
DOCS=( README.md )

node_module_run_test() {
	install_node_module_build_depend "nodeunit:0"
	nodeunit || die "Tests failed"
}
