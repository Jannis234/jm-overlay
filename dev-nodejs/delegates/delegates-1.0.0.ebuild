# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="should:11.1.1"

inherit node-module

DESCRIPTION="Delegate methods and accessors to another property"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( Readme.md History.md )

src_compile() { :; }

node_module_run_test() {
	mocha --require should || die "Tests failed"
}
