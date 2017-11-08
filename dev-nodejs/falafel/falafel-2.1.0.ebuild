# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="acorn:5.2.1
	foreach:2.0.5
	isarray:0.0.1
	object-keys:1.0.11"
NODE_MODULE_TEST_DEPEND="tape:4.8.0
	acorn-jsx:3.0.1"

inherit node-module

DESCRIPTION="Transform the ast on a recursive walk"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( readme.markdown )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	tap test/*.js || die "Tests failed"
}
