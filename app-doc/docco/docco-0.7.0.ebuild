# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.2.0"
NODE_MODULE_EXTRA_FILES="bin resources"
NODE_MODULE_DEPEND="underscore:1.8.3
	marked:0.3.5
	commander:2.9.0
	fs-extra:0.30.0"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/highlight-js:9.3.0"
SLOT="0"

DESCRIPTION="The Quick and Dirty Literate Programming Documentation Generator"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README )

src_install() {
	node-module_src_install
	install_node_module_depend "highlight.js:9.3.0"
	install_node_module_binary "bin/docco" "/usr/bin/docco"
}
