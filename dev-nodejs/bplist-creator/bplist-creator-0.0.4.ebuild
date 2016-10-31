# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bplistCreator.js"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="stream-buffers:0.2.6"
NODE_MODULE_TEST_DEPEND="bplist-parser:0.0.4"

inherit node-module

DESCRIPTION="Binary Mac OS X Plist (property list) creator"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/nodeunit )"
DOCS=( README.md )

node_module_run_test() {
	install_node_module_build_depend "nodeunit:0"
	nodeunit || die "Tests failed"
}
