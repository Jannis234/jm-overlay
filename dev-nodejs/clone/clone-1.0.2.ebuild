# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODEJS_MIN_VERSION="0.8"

inherit node-module

DESCRIPTION="Deep cloning of objects and arrays"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/nodeunit )"

node_module_run_test() {
	nodeunit test.js || die "Tests failed"
}
