# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:2.14.1"

inherit node-module

DESCRIPTION="Base64 encoding/decoding in pure JS"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"
DOCS=( README.md )

src_test() {
	node-module_src_test
	tap test || die "Tests failed"
}
