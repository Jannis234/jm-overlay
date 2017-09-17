# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:3.6.1"

inherit node-module

DESCRIPTION="Returns an arbitrary generator function"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test || die "Tests failed"
}
