# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="hashish:0.0.4
	chai:3.5.0"

inherit node-module

DESCRIPTION="Light-weight option parsing with an argv hash. No optstrings attached."

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	mocha -R list || die "Tests failed"
	echo
}
