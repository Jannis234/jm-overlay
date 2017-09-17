# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="cjs es6"
NODE_MODULE_DEPEND="should-type:1.4.0
	should-type-adaptors:1.0.1"

inherit node-module

DESCRIPTION="Formatting of objects for should.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
