# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="as-function.js cjs es6"
NODE_MODULE_DEPEND="should-equal:1.0.1
	should-format:3.0.2
	should-type:1.4.0
	should-type-adaptors:1.0.1
	should-util:1.0.0"

inherit node-module

DESCRIPTION="Test framework agnostic BDD-style assertions"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( Readme.md History.md CONTRIBUTING.md )
