# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="js-tokens:3.0.2"
NODE_MODULE_EXTRA_FILES="custom.js replace.js"

inherit node-module

DESCRIPTION="Fast selective process.env replacer using js-tokens instead of an AST"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
