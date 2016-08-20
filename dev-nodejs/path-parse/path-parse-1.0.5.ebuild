# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_EXTRA_FILES="index.min.js"

inherit node-module

DESCRIPTION="Node.js path.parse() ponyfill"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	dev-util/uglifyjs"
DOCS=( README.md )

src_compile() {
	uglifyjs -m -o index.min.js index.js || die
}

src_test() {
	node-module_src_test
	node test.js || die "Tests failed"
}
