# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="tape:2.3.3
	stream-spec:0.3.6
	from:0.1.3"

inherit node-module

DESCRIPTION="Simplified stream construction"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.markdown )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	tap test || die "Tests failed"
}
