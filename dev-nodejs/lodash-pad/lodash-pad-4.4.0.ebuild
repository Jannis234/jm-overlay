# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="lodash.pad"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash_basetostring:4.12.0
	dev-nodejs/lodash_baseslice:4.0.0
	dev-nodejs/lodash-tostring:4.1.3"

DESCRIPTION="The lodash method \"_.pad\" exported as a module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash._basetostring:4.12.0"
	install_node_module_depend "lodash._baseslice:4.0.0"
	install_node_module_depend "lodash.tostring:4.1.3"
}
