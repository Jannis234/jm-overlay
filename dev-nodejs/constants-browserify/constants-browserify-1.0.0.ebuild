# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="constants.json"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Node's constants module for the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	net-libs/nodejs"
DOCS=( README.md )

src_compile() {
	sh build.sh || die
}

node_module_run_test() {
	node test.js || die "Tests failed"
}
