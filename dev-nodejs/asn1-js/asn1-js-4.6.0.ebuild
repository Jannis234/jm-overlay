# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="rfc"
NODE_MODULE_NAME="asn1.js"
NODE_MODULE_DEPEND="minimalistic-assert:1.0.0
	inherits:2.0.1"
NODE_MODULE_HAS_TEST="1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/bn-js:4.11.3"
DEPEND="${DEPEND}
	test? (
		dev-nodejs/bn-js:4.11.3
		dev-util/mocha
	)"

DESCRIPTION="ASN.1 encoder and decoder"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "bn.js:4.11.3"
	rm -r "${D}/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}"/rfc/*/test || die
}

node_module_run_test() {
	install_node_module_build_depend "bn.js:4.11.3"
	mocha test/*-test.js rfc/*/test/*-test.js || die "Tests failed"
}
