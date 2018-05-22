# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Traverse JSON Schema passing each schema object to callback"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

node_module_run_test() {
	mocha spec -R spec || die "Tests failed"
}
