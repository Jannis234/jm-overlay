# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="minimatch:2.0.10
	glob:5.0.15"

inherit node-module

DESCRIPTION="Wrapper around miniglob / minimatch combo"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

node_module_run_test() {
	node tests/test.js || die "Tests failed"
	node tests/test-sync.js || die "Tests failed"
}
