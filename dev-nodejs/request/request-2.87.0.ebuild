# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="aws-sign2:0.7.0
	aws4:1.7.0
	caseless:0.12.0
	combined-stream:1.0.6
	extend:3.0.1
	forever-agent:0.6.1
	form-data:2.3.2
	har-validator:5.0.3
	http-signature:1.2.0
	is-typedarray:1.0.0
	isstream:0.1.2
	json-stringify-safe:5.0.1
	mime-types:2.1.18
	oauth-sign:0.8.2
	performance-now:2.1.0
	qs:6.5.2
	safe-buffer:5.1.2
	tough-cookie:2.3.4
	tunnel-agent:0.6.0
	uuid:3.2.1"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
