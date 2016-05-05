# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js helpers.js md5.js"
NODE_MODULE_DEPEND="cipher-base:1.0.2
	inherits:2.0.1
	ripemd160:1.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/sha-js:2.4.5"

DESCRIPTION="Create hashes for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )

src_install() {
	node-module_src_install
	install_node_module_depend "sha.js:2.4.5"
}
