# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.6"
NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_DEPEND="lcov-parse:0.0.6
	log-driver:1.2.4
	minimist:1.2.0
	js-yaml:3.0.1
	request:2.67.0"

inherit node-module

DESCRIPTION="Takes json-cov output into stdin and POSTs to coveralls.io"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_compile() { :; }
