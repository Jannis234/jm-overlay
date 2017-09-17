# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:2.12.3"

inherit node-module

DESCRIPTION="Determine if an object is a Stream"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? (
		dev-util/tap:0
		dev-nodejs/readable-stream:1.0.34
		dev-nodejs/readable-stream:1.1.14
	)"

node_module_run_test() {
	install_node_module_build_depend "readable-stream:1.0.34"
	mv ./node_modules/readable-stream ./readable-stream-1.0 || die
	install_node_module_build_depend "readable-stream:1.1.14"
	mv ./node_modules/readable-stream ./readable-stream-1.1 || die
	tap test.js || die "Tests failed"
}
