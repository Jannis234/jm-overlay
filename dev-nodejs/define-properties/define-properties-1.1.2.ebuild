# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="foreach:2.0.5
	object-keys:1.0.11"
NODE_MODULE_TEST_DEPEND="tape:4.6.3"

inherit node-module

DESCRIPTION="Define multiple non-enumerable properties at once"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md CHANGELOG.md )

node_module_run_test() {
	tap test || die "Tests failed"
}
