# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_EXTRA_FILES="shim.js"
NODE_MODULE_DEPEND="os-homedir:1.0.1
	signal-exit:2.1.2
	which:1.2.10
	mkdirp:0.5.1
	foreground-child:1.5.3
	rimraf:2.5.4"

inherit node-module

DESCRIPTION="Wrap all spawned Node.js child processes"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"
DOCS=( README.md )

src_test() {
	node-module_src_test
	install_node_module_build_depend "tap:0"
	tap test/*.js || die "Tests failed"
}
