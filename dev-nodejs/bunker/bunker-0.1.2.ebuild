# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="burrito:0.2.12"

inherit node-module

DESCRIPTION="Code coverage in native javascript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( README.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	# Fixed in upstream git repo, but never actually released
	sed -i "/unary-postfix/d" test/cover.js || die
	tap test/*.js || die "Tests failed"
}
