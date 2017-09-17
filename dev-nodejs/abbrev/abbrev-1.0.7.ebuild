# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Like ruby's abbrev module, but in js"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

DOCS=( README.md CONTRIBUTING.md )

node_module_run_test() {
	tap test.js || die "Tests failed"
}
