# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="create-hmac:1.1.4
	inherits:2.0.1
	randombytes:2.0.3
	pbkdf2:3.0.4
	create-hash:1.1.2
	diffie-hellman:5.0.2
	create-ecdh:4.0.0
	browserify-cipher:1.0.0
	browserify-sign:4.0.0
	public-encrypt:4.0.0"

inherit node-module

DESCRIPTION="Implementation of crypto for the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
