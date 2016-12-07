# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="aws-sign2:0.6.0
	aws4:1.5.0
	caseless:0.11.0
	combined-stream:1.0.5
	extend:3.0.0
	forever-agent:0.6.1
	form-data:2.1.2
	har-validator:2.0.6
	hawk:3.1.3
	http-signature:1.1.1
	is-typedarray:1.0.0
	isstream:0.1.2
	json-stringify-safe:5.0.1
	mime-types:2.1.13
	oauth-sign:0.8.2
	qs:6.3.0
	stringstream:0.0.5
	tough-cookie:2.3.2
	tunnel-agent:0.4.3
	uuid:3.0.1"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md CONTRIBUTING.md )
