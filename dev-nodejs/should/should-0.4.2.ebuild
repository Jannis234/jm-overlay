# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.2.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Test framework agnostic BDD-style assertions"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RESTRICT="test" # Broken

DEPEND="${DEPEND}
	test? ( dev-util/mocha )"
DOCS=( Readme.md History.md )

src_compile() { :; }

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}

src_test() {
	node-module_src_test
	mocha --ui exports test || die "Tests failed"
}
