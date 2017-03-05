# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_EXTRA_FILES="src"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="function-bind:1.1.0"
NODE_MODULE_TEST_DEPEND="chai:1.7.2"

inherit node-module

DESCRIPTION="Object.prototype.hasOwnProperty.call shortcut"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.mkd )
DEPEND="${DEPEND}
	test? ( dev-util/mocha )"

node_module_run_test() {
	mocha || die "Tests failed"
}
