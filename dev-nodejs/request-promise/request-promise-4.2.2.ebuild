# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="errors.js"
NODE_MODULE_DEPEND="bluebird:3.5.1
	request-promise-core:1.1.1
	stealthy-require:1.1.1
	tough-cookie:2.3.4
	request:2.87.0"
NODEJS_MIN_VERSION="0.10.0"

inherit node-module

DESCRIPTION="Request with Promise support. Powered by Bluebird."

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
