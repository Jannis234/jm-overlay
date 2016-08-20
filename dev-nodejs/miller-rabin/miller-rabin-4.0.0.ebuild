# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="brorand:1.0.5"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/bn-js:4.11.3"

DESCRIPTION="Miller Rabin algorithm for primality test"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "bn.js:4.11.3"
}
