# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="inherits:2.0.1
	block-stream:0.0.9
	fstream:1.0.9"

inherit node-module

DESCRIPTION="Tar for node"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
