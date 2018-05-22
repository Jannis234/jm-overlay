# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="dashdash:1.14.1
	assert-plus:1.0.0
	getpass:0.1.7
	jsbn:0.1.1
	ecc-jsbn:0.1.1
	tweetnacl:0.14.5
	asn1:0.2.3
	bcrypt-pbkdf:1.0.1"

inherit node-module

DESCRIPTION="A library for finding and using SSH public keys"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
