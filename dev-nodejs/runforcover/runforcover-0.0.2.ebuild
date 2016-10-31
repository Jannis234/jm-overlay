# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="bunker:0.1.2"

inherit node-module

DESCRIPTION="Require plugin for js code coverage using bunker"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.markdown )

node_module_run_test() {
	node test/index.js || die "Tests failed"
}
