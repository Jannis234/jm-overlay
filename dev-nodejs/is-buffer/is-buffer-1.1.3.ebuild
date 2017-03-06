# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:4.6.3"

inherit node-module

DESCRIPTION="Determine if an object is Buffer"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test || die "Tests failed"
}
