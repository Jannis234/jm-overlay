# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="repeat-element:1.1.2
	preserve:0.2.0
	expand-range:1.8.2"

inherit node-module

DESCRIPTION="Fastest brace expansion for node.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
