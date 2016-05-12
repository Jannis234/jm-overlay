# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_DEPEND="assert-plus:0.1.5
	ctype:0.5.3
	asn1:0.1.11"

inherit node-module

DESCRIPTION="Reference implementation of Joyent's HTTP Signature scheme"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use doc && dodoc http_signing.md
}
