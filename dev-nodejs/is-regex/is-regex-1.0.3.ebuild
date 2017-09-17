# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:3.4.0"

inherit node-module

DESCRIPTION="Is this value a JS regex?"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_compile() { :; }

node_module_run_test() {
	tap test.js || die "Tests failed"
}
