# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="convert-source-map:1.1.3
	inline-source-map:0.5.0
	source-map:0.4.4"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-memoize:3.0.4"
DEPEND="${DEPEND}
	test? (
		dev-nodejs/lodash-memoize:3.0.4
		dev-util/tap:0
	)"

DESCRIPTION="Add source maps of files, offset them and combine them into one source map"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.memoize:3.0.4"
	use examples && dodoc -r example
}

node_module_run_test() {
	install_node_module_build_depend "lodash.memoize:3.0.4"
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
