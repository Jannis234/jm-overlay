# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="aesid.json asn1.js fixProc.js"
NODE_MODULE_DEPEND="evp_bytestokey:1.0.0
	create-hash:1.1.2
	pbkdf2:3.0.4
	browserify-aes:1.0.6"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/asn1-js:4.6.0"

DESCRIPTION="Utility library for parsing asn1 files for use with browserify-sign"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "asn1.js:4.6.0"
}
