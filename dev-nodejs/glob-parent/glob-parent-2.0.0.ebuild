# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="is-glob:2.0.1"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Strips glob magic from a string to provide the parent path"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

node_module_run_test() {
	mocha || die "Tests failed"
}
