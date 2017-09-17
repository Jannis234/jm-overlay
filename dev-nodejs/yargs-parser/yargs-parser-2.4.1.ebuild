# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="camelcase:3.0.0"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-assign:4.2.0"

DESCRIPTION="The mighty option parser used by yargs"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.assign:4.2.0"
}
