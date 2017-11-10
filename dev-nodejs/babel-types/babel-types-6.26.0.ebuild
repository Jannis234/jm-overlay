# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="to-fast-properties:1.0.3
	esutils:2.0.2
	lodash:4.17.4
	babel-runtime:6.26.0"

inherit node-module

DESCRIPTION="Methods for building ASTs manually and for checking the types of AST nodes"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
