# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="inherits:2.0.1
	fstream-ignore:1.0.5"
NODE_MODULE_TEST_DEPEND="graceful-fs:4.1.6
	mkdirp:0.5.1
	rimraf:2.5.4"

inherit node-module

DESCRIPTION="Fstream class for creating npm package"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"
DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
