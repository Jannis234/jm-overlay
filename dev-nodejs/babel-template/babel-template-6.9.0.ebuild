# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="babylon:6.8.4
	babel-types:6.13.0
	babel-traverse:6.13.0
	babel-runtime:6.11.6
	lodash:4.15.0"

inherit node-module

DESCRIPTION="Generate an AST from a string template"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
