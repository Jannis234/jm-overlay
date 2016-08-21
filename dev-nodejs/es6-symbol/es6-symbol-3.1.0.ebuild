# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="implement.js is-implemented.js is-native-implemented.js is-symbol.js polyfill.js validate-symbol.js"
NODE_MODULE_DEPEND="d:0.1.1
	es5-ext:0.10.12"

inherit node-module

DESCRIPTION="ECMAScript 6 Symbol polyfill"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES )
