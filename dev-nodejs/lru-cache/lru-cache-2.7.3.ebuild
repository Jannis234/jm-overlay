# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="A cache object that deletes the least-recently-used items"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

DOCS=( README.md CONTRIBUTORS )

node_module_run_test() {
	install_node_module_build_depend "tap:0"

	rm test/memory-leak.js || die # Broken
	tap test || die "Tests failed"
}
