# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="${PN}_browser.js"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Browser-friendly inheritance fully compatible with standard node.js inherits()"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

node_module_run_test() {
	node test.js || die "Tests failed"
}
