# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="lodash._baseassign"

inherit node-module

DESCRIPTION="The modern build of lodash's internal baseAssign as a module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND="${RDEPEND}
	dev-nodejs/lodash_basecopy:3.0.1
	dev-nodejs/lodash-keys:3.1.2"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash._basecopy:3.0.1"
	install_node_module_depend "lodash.keys:3.1.2"
}
