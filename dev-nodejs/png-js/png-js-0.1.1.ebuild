# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6.0"

inherit node-module

DESCRIPTION="A PNG decoder in CoffeeScript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
NODE_MODULE_DEFAULT_FILES="package.json png-node.js"
DEPEND=">=dev-lang/coffee-script-1.0.1"

src_compile() {
	coffee -c png-node.coffee || die
}
