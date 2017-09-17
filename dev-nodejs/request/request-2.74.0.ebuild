# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="aws-sign2:0.6.0
	tunnel-agent:0.4.3
	forever-agent:0.6.1
	oauth-sign:0.8.2
	caseless:0.11.0
	is-typedarray:1.0.0
	stringstream:0.0.5
	aws4:1.4.1
	isstream:0.1.2
	json-stringify-safe:5.0.1
	extend:3.0.0
	tough-cookie:2.3.1
	qs:6.2.1
	node-uuid:1.4.7
	combined-stream:1.0.5
	mime-types:2.1.11
	form-data:1.0.0-rc4
	hawk:3.1.3
	bl:1.1.2
	http-signature:1.1.1
	har-validator:2.0.6"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md CONTRIBUTING.md )
