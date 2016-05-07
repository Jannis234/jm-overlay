# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"
NODE_MODULE_DEPEND="json-stable-stringify:0.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/sha-js:2.4.5"

DESCRIPTION="Single function that returns the sha1sum"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "sha.js:2.4.5"
}
