# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="deep-is:0.1.3
	charm:0.1.2
	traverse:0.6.6"
NODE_MODULE_TEST_DEPEND="ent:0.0.7"

inherit node-module

DESCRIPTION="Colorful diffs for javascript objects"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"
DOCS=( README.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
