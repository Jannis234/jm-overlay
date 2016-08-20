# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="tunnel-agent:0.4.2
	aws-sign2:0.6.0
	forever-agent:0.6.1
	oauth-sign:0.8.2
	is-typedarray:1.0.0
	caseless:0.11.0
	stringstream:0.0.5
	aws4:1.4.1
	isstream:0.1.2
	json-stringify-safe:5.0.1
	extend:3.0.0
	tough-cookie:2.2.2
	node-uuid:1.4.7
	qs:6.0.2
	combined-stream:1.0.5
	mime-types:2.1.10
	form-data:1.0.0-rc4
	hawk:3.1.3
	bl:1.0.3
	http-signature:1.1.1
	har-validator:2.0.6"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md CONTRIBUTING.md )
