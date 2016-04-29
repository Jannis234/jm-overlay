# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="end-of-stream:1.0.0
	inherits:2.0.1
	readable-stream:2.1.2"

inherit node-module

DESCRIPTION="Turn a writeable and readable stream into a streams2 duplex stream"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc example.js
}
