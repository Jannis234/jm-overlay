# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="macgyver:1.10.1"

inherit node-module

DESCRIPTION="Simple module to get instance type. Like a bit more advanced version of typeof"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DOCS=( readme.markdown )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0.7 )"

src_install() {
	node-module_src_install
	use doc && dodoc api-style.markdown states.markdown stream_spec.md
}

node_module_run_test() {
	tap-0.7 test || die "Tests failed"
}
