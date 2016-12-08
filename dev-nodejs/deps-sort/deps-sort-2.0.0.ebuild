# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="subarg:1.0.0
	through2:2.0.3
	JSONStream:1.2.1
	shasum:1.0.2"

inherit node-module

DESCRIPTION="Sort module-deps output for deterministic browserify bundle"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

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
