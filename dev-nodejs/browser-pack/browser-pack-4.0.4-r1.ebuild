# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="prelude.js _prelude.js"
NODE_MODULE_DEPEND="combine-source-map:0.3.0
	through2:0.5.1
	umd:3.0.1
	JSONStream:1.1.1
	defined:1.0.0
	concat-stream:1.4.10"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:3.6.1
	parse-base64vlq-mappings:0.1.4
	convert-source-map:0.3.5"

inherit node-module

DESCRIPTION="Pack node-style source files from a json stream into a browser bundle"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	tap test || die "Tests failed"
}
