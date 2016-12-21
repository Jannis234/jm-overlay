# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="inject.js xhtml.js"
NODE_MODULE_DEPEND="acorn:2.7.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Alternative, faster React.js JSX parser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( net-libs/nodejs )"
DOCS=( README.md )

node_module_run_test() {
	node test/run.js || die "Tests failed"
}
