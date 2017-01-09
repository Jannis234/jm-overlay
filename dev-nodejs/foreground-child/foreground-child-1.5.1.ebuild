# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="signal-exit:2.1.2
	cross-spawn-async:2.2.4
	which:1.2.10"

inherit node-module

DESCRIPTION="Run a child as if it's the foreground process. Give it stdio. Exit when it exits"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"
DOCS=( README.md )

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
