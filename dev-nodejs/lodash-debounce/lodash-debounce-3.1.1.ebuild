# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="lodash.debounce"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash_getnative:3.9.1"

DESCRIPTION="The modern build of lodash’s _.debounce as a module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash._getnative:3.9.1"
}
