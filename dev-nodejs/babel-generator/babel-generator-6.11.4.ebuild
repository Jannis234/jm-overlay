# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="babel-messages:6.8.0
	source-map:0.5.6
	babel-types:6.13.0
	detect-indent:3.0.1
	lodash:4.15.0
	babel-runtime:6.11.6"

inherit node-module

DESCRIPTION="Turns an AST into code"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
