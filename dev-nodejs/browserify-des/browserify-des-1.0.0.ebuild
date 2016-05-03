# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="modes.js"
NODE_MODULE_DEPEND="cipher-base:1.0.2"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/des-js:1.0.0"

DESCRIPTION="DES for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )

src_install() {
	node-module_src_install
	install_node_module_depend "des.js:1.0.0"
}
