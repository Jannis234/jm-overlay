# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="lodash:4.17.10
	request:2.87.0"
NODE_MODULE_EXTRA_FILES="configure errors.js"
NODEJS_MIN_VERSION="0.10.0"

inherit node-module

DESCRIPTION="Core Promise support implementation for request"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_configure() { :; }
