# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="esprima:1.0.4"
NODE_MODULE_TEST_DEPEND="tape:0.0.5"

inherit node-module

DESCRIPTION="Transform the ast on a recursive walk"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.markdown )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test || die "Tests failed"
}
