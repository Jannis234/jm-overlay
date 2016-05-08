# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="indexof:0.0.1
	isarray:0.0.1
	inherits:2.0.1
	readable-wrap:1.0.0
	through2:1.1.1
	readable-stream:1.1.14"

inherit node-module

DESCRIPTION="Streaming pipeline with a mutable configuration"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
