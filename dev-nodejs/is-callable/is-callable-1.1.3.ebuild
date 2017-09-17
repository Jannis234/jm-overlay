# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:4.6.3
	make-generator-function:1.1.0
	make-arrow-function:1.1.0
	foreach:2.0.5"

inherit node-module

DESCRIPTION="Is this JS value callable?"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_compile() { :; }

node_module_run_test() {
	tap test.js || die "Tests failed"
}
