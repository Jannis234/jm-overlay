# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_EXTRA_FILES="es2015 source"
NODE_MODULE_DEPEND="editions:1.3.3
	typechecker:4.4.0"

inherit node-module

DESCRIPTION="Give iterator the value and key of each item, stop if iterator returned false"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md HISTORY.md )

src_install() {
	node-module_src_install
	use examples && dodoc example.js
}
