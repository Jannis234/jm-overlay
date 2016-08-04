# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_EXTRA_FILES="bin images mocha.css browser-entry.js"
NODE_MODULE_DEPEND="escape-string-regexp:1.0.5
	commander:2.9.0
	diff:1.4.0
	supports-color:3.1.2
	growl:1.9.2
	debug:2.2.0
	mkdirp:0.5.1
	glob:7.0.5
	browser-stdout:1.3.0
	json3:3.3.2"

inherit node-module

SLOT="0"
RDEPEND="${RDEPEND}
	dev-nodejs/lodash-create:3.1.1"

DESCRIPTION="Simple, flexible, fun test framework"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( CHANGELOG.md README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.create:3.1.1"
	install_node_module_binary "bin/mocha" "/usr/bin/mocha"
}
