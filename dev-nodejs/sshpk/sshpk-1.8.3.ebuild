# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="dashdash:1.13.1
	assert-plus:1.0.0
	getpass:0.1.6
	jsbn:0.1.0
	ecc-jsbn:0.1.1
	tweetnacl:0.13.3
	asn1:0.2.3
	jodid25519:1.0.2"

inherit node-module

DESCRIPTION="A library for finding and using SSH public keys"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
