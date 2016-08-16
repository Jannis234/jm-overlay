# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="base64.js base64.min.js"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Base64 encoding and decoding"

LICENSE="WTFPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	dev-util/uglifyjs
	test? (
		dev-lang/coffee-script
		dev-util/mocha
	)"
DOCS=( README.md )

src_prepare() {
	default
	rm base64.min.js || die
}

src_compile() {
	emake UGLIFYJS=uglifyjs
	if use test; then
		coffee -c test/base64.coffee
	fi
}

src_test() {
	mocha test || die "Tests failed"
}
