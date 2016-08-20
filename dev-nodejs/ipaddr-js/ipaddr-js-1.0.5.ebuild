# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_NAME="ipaddr.js"
NODE_MODULE_EXTRA_FILES="ipaddr.min.js"

inherit node-module

DEPEND="dev-lang/coffee-script
	dev-util/uglifyjs"

DESCRIPTION="A library for manipulating IPv4 and IPv6 addresses in JavaScript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_compile() {
	coffee -c -o lib src || die
	uglifyjs -m -c -o ipaddr.min.js lib/ipaddr.js || die
}
