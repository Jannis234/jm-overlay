# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="dist"
NODE_MODULE_DEPEND="base64-js:0.0.6
	util-deprecate:1.0.0
	xmlbuilder:2.2.1
	xmldom:0.1.22"

inherit node-module

DESCRIPTION="Mac OS X Plist parser/builder for Node.js and browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md History.md )

src_compile() { :; }

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
