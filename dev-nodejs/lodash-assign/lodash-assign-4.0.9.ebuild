# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_NAME="lodash.assign"

inherit node-module

DESCRIPTION="The lodash method _.assign exported as a module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-keys:4.0.7
	dev-nodejs/lodash-rest:4.0.3"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.keys:4.0.7"
	install_node_module_depend "lodash.rest:4.0.3"
}
