# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="js-tokens:1.0.3"
NODE_MODULE_EXTRA_FILES="custom.js replace.js"

inherit node-module

DESCRIPTION="Fast selective process.env replacer using js-tokens instead of an AST"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
