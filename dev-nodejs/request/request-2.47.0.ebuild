# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="aws-sign2:0.5.0
	caseless:0.6.0
	oauth-sign:0.4.0
	tunnel-agent:0.4.2
	stringstream:0.0.5
	json-stringify-safe:5.0.1
	tough-cookie:2.2.2
	mime-types:1.0.2
	forever-agent:0.5.2
	qs:2.3.3
	node-uuid:1.4.7
	http-signature:0.10.1
	combined-stream:0.0.7
	hawk:1.1.1
	form-data:0.1.4
	bl:0.9.5"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md CONTRIBUTING.md )
