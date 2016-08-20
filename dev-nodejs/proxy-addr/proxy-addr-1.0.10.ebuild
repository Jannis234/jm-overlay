# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="forwarded:0.1.0"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/ipaddr-js:1.0.5"

DESCRIPTION="Determine address of proxied request"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )

src_install() {
	node-module_src_install
	install_node_module_depend "ipaddr.js:1.0.5"
}
