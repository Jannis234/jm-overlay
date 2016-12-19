# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Node's event emitter for all engines"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( Readme.md History.md )

node_module_run_test() {
	mocha tests/index.js --ui qunit || die "Tests failed"
}
