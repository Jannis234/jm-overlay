# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Node's assert.deepEqual algorithm"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test examples"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

DOCS=( README.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
