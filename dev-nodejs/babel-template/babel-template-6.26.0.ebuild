# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="babel-runtime:6.26.0
	babel-traverse:6.26.0
	babel-types:6.26.0
	babylon:6.18.0
	lodash:4.17.4"

inherit node-module

DESCRIPTION="Generate an AST from a string template"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
