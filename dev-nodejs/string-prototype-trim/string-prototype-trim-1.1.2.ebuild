# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"
NODE_MODULE_NAME="string.prototype.trim"
NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="implementation.js polyfill.js shim.js"
NODE_MODULE_DEPEND="function-bind:1.1.0
	define-properties:1.1.2
	es-abstract:1.5.1"
NODE_MODULE_TEST_DEPEND="tape:4.6.3"

inherit node-module

DESCRIPTION="ES5 spec-compliant shim for String.prototype.trim"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

src_compile() { :; }

node_module_run_test() {
	tap test/index.js test/shimmed.js || die "Tests failed"
}
