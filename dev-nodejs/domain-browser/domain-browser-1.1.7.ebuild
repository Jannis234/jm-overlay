# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_TEST_DEPEND="assert-helpers:4.4.0"

inherit node-module

DESCRIPTION="Node's domain module for the web browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )

node_module_run_test() {
	# The test scripts fail if these two modules are symlinks
	cp -r "${EROOT}usr/$(get_libdir)/node/joe/1.8.0" "node_modules/joe" || die
	cp -r "${EROOT}usr/$(get_libdir)/node/joe-reporter-console/1.2.1" "node_modules/joe-reporter-console" || die
	node test.js || die "Tests failed"
}
