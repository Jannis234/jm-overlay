# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="babel-messages:6.8.0
	globals:8.18.0
	babylon:6.8.4
	debug:2.2.0
	babel-types:6.13.0
	invariant:2.2.1
	babel-code-frame:6.11.0
	lodash:4.15.0
	babel-runtime:6.11.6"

inherit node-module

DESCRIPTION="Babel-traverse"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
