# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="1"
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
