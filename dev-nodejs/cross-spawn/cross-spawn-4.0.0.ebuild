# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="lru-cache:4.0.1
	which:1.2.10"

inherit node-module

DESCRIPTION="Cross platform child_process#spawn and child_process#spawnSync"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install

	use examples && newdoc foo example.js
}
