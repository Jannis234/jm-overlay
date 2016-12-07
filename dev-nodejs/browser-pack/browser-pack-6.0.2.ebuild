# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="prelude.js _prelude.js"
NODE_MODULE_DEPEND="combine-source-map:0.7.2
	through2:2.0.3
	umd:3.0.1
	JSONStream:1.2.1
	defined:1.0.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="concat-stream:1.5.1
	parse-base64vlq-mappings:0.1.4
	convert-source-map:1.1.3"

inherit node-module

DESCRIPTION="Pack node-style source files from a json stream into a browser bundle"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
