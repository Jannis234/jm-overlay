# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_EXTRA_FILES="es5.js es6.js es7.js helpers"
NODE_MODULE_DEPEND="function-bind:1.1.0
	is-regex:1.0.3
	is-callable:1.1.3
	es-to-primitive:1.1.1"
NODE_MODULE_TEST_DEPEND="tape:4.6.3
	object-is:1.0.1
	foreach:2.0.5"

inherit node-module

DESCRIPTION="ECMAScript spec abstract operations"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md CHANGELOG.md )

src_compile() { :; }

node_module_run_test() {
	tap test || die "Tests failed"
}
