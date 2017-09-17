# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="should:11.2.0"

inherit node-module

DESCRIPTION="Parses JavaScript objects into XML"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( README.md CHANGES.md NOTICE.md )
DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	mocha || die "Tests failed"
}
