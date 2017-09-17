# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="defined:1.0.0
	acorn:3.3.0"

inherit node-module

DESCRIPTION="Find all require() calls by walking the AST"

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
	tap test/*.js || die "Tests failed"
}
