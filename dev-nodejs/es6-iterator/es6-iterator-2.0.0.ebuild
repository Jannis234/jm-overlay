# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="# array.js for-of.js get.js is-iterable.js string.js valid-iterable.js"
NODE_MODULE_DEPEND="d:0.1.1
	es5-ext:0.10.12
	es6-symbol:3.1.0"

inherit node-module

DESCRIPTION="Iterator abstraction based on ES6 specification"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES )
