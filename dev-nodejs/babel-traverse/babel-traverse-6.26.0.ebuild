# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="babel-code-frame:6.26.0
	babel-messages:6.23.0
	babel-runtime:6.26.0
	babel-types:6.26.0
	babylon:6.18.0
	debug:2.6.9
	globals:9.18.0
	invariant:2.2.2
	lodash:4.17.4"

inherit node-module

DESCRIPTION="Babel-traverse"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
