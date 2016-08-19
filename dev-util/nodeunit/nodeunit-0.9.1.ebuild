# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bin deps share"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="should:0.4.2"

inherit node-module

SLOT="0"
RDEPEND="${RDEPEND}
	dev-util/tap:0.7"

DESCRIPTION="Easy unit testing for node.js and the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( CONTRIBUTORS.md README.md )
PATCHES=( "${FILESDIR}/nodeunit-0.9.1-fix-testsuite.patch" )

src_compile() { :; }

src_install() {
	node-module_src_install
	install_node_module_depend "tap:0.7"
	install_node_module_binary "bin/nodeunit" "/usr/bin/nodeunit"
	doman man1/nodeunit.1
	use examples && dodoc -r examples img/example_*
}

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0.7"
	./bin/nodeunit || die "Tests failed"
}
