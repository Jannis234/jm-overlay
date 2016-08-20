# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"
NODE_MODULE_DEPEND="randombytes:2.0.3
	miller-rabin:4.0.0"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/bn-js:4.11.3"

DESCRIPTION="Pure js diffie-hellman"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )

src_install() {
	node-module_src_install
	install_node_module_depend "bn.js:4.11.3"
}
