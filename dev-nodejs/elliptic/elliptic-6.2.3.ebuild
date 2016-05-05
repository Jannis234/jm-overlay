# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="brorand:1.0.5"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/hash-js:1.0.3"

DESCRIPTION="EC cryptography"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "hash.js:1.0.3"
}
