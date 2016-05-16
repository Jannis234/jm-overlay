# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="formats.js require.js"
NODE_MODULE_DEPEND="jsonpointer:2.0.0
	generate-function:2.0.0
	xtend:4.0.1
	generate-object-property:1.2.0"

inherit node-module

DESCRIPTION="A JSONSchema validator that uses code generation to be extremely fast"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc example.js
}
