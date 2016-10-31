# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="async:0.2.10"

inherit node-module

DESCRIPTION="A simple utility for getting a hash of a file"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( README.md History.md )

node_module_run_test() {
	mocha test || die "Tests failed"
}
