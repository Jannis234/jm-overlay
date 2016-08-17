# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="bn.js"
NODE_MODULE_EXTRA_FILES="util"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Big number implementation in pure javascript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( README.md )

src_test() {
	node-module_src_test
	mocha test || die "Tests failed"
}
