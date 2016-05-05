# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="rfc"
NODE_MODULE_NAME="asn1.js"
NODE_MODULE_DEPEND="minimalistic-assert:1.0.0
	inherits:2.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/bn-js:4.11.3"

DESCRIPTION="ASN.1 encoder and decoder"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_prepare() {
	eapply_user
	rm -r rfc/*/test || die
}

src_install() {
	node-module_src_install
	install_node_module_depend "bn.js:4.11.3"
}
