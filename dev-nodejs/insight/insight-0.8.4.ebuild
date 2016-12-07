# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="async:1.5.2
	chalk:1.1.3
	configstore:1.4.0
	inquirer:0.10.1
	object-assign:4.1.0
	os-name:1.0.3
	request:2.79.0
	tough-cookie:2.3.2
	uuid:3.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-debounce:3.1.1"

DESCRIPTION="Understand how your tool is being used by anonymously reporting usage metrics"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.debounce:3.1.1"
}
