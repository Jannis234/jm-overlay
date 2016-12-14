# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="jsbn:0.1.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="ECC JS code based on JSBN"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

node_module_run_test() {
	node test.js || die "Tests failed"
}
