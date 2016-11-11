# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="xhtml.js inject.js"
NODE_MODULE_DEPEND="acorn:3.3.0"

inherit node-module

DESCRIPTION="ECMAScript parser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
