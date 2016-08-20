# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="algos.js algos.json browser.js curves.js ec.param sign.js verify.js"
NODE_MODULE_DEPEND="create-hmac:1.1.4
	inherits:2.0.1
	browserify-rsa:4.0.1
	elliptic:6.2.3
	create-hash:1.1.2
	parse-asn1:5.0.0"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/bn-js:4.11.3"

DESCRIPTION="Adds node crypto signing for browsers"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "bn.js:4.11.3"
}
