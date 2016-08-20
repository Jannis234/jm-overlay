# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="lodash.keys"

inherit node-module

DESCRIPTION="The lodash method _.keys exported as a module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-isarguments:3.0.9
	dev-nodejs/lodash-isarray:3.0.4
	dev-nodejs/lodash_getnative:3.9.1"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.isarguments:3.0.9"
	install_node_module_depend "lodash.isarray:3.0.4"
	install_node_module_depend "lodash._getnative:3.9.1"
}
