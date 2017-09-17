# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="xhtml.js inject.js"
NODE_MODULE_DEPEND="acorn:2.7.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="ECMAScript parser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

node_module_run_test() {
	node test/run.js || die "Tests failed"
}
