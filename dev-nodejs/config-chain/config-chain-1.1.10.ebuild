# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="ini:1.3.4
	proto-list:1.2.4"

inherit node-module

DESCRIPTION="Handle configuration once and for all"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.markdown )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_prepare() {
	sed -i "s|/tmp/|${T}|g" test/*.js || die # Prevent sandbox violations
	rm test/find-file.js || die # Causes problems in sandbox
	eapply_user
}

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test || die "Tests failed"
}
