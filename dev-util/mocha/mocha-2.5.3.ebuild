# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_EXTRA_FILES="bin images mocha.css"
NODE_MODULE_DEPEND="escape-string-regexp:1.0.2
	commander:2.3.0
	diff:1.4.0
	supports-color:1.2.0
	growl:1.9.2
	to-iso-string:0.0.2
	debug:2.2.0
	jade:0.26.3
	mkdirp:0.5.1
	glob:3.2.11"

inherit node-module

SLOT="0"

DESCRIPTION="Simple, flexible, fun test framework"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( CHANGELOG.md )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/mocha" "/usr/bin/mocha"
}
