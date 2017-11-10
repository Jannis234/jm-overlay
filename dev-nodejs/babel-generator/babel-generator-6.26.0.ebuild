# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="babel-messages:6.23.0
	babel-runtime:6.26.0
	babel-types:6.26.0
	detect-indent:4.0.0
	jsesc:1.3.0
	lodash:4.17.0
	source-map:0.5.7
	trim-right:1.0.1"

inherit node-module

DESCRIPTION="Turns an AST into code"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
