# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:0.1.5"

inherit node-module

DESCRIPTION="Render nested hierarchies \"npm ls\" style with unicode pipes"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test examples"

DOCS=( readme.markdown )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}

node_module_run_test() {
	tap test || die "Tests failed"
}
