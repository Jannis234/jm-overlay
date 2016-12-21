# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="acorn:1.2.2
	foreach:2.0.5
	isarray:0.0.1
	object-keys:1.0.9"
NODE_MODULE_TEST_DEPEND="tape:4.6.3
	acorn-jsx:2.0.1"

inherit node-module

DESCRIPTION="Transform the ast on a recursive walk"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="${DEPEND}
	test? (
		dev-util/tap:0
		net-libs/nodejs
	)"
DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	node test/bin/run.js test/*.js | tap - || die "Tests failed"
}
