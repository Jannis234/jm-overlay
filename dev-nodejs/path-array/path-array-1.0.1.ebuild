# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="array-index:1.0.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Treat your \$PATH like a JavaScript Array"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( README.md History.md )

node_module_run_test() {
	mocha || die "Tests failed"
}
