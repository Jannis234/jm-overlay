# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Simple JSON Addressing"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

node_module_run_test() {
	node test.js || die "Tests failed"
}
