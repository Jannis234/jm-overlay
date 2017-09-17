# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="pify:2.3.0
	graceful-fs:4.1.4
	strip-bom:2.0.0
	pinkie-promise:2.0.1
	parse-json:2.2.0"

inherit node-module

DESCRIPTION="Read and parse a JSON file"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
