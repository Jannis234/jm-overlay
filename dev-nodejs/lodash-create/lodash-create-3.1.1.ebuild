# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="lodash.create"

inherit node-module

DESCRIPTION="The modern build of lodash’s _.create as a module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${RDEPEND}
	dev-nodejs/lodash_basecreate:3.0.3
	dev-nodejs/lodash_isiterateecall:3.0.9
	dev-nodejs/lodash_baseassign:3.2.0"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash._basecreate:3.0.3"
	install_node_module_depend "lodash._isiterateecall:3.0.9"
	install_node_module_depend "lodash._baseassign:3.2.0"
}
