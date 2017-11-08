# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4.0.0"
NODE_MODULE_EXTRA_FILES="bin images mocha.css browser-entry.js"
NODE_MODULE_DEPEND="browser-stdout:1.3.0
	commander:2.11.0
	debug:3.1.0
	diff:3.3.1
	escape-string-regexp:1.0.5
	glob:7.1.2
	growl:1.10.3
	he:1.1.1
	mkdirp:0.5.1
	supports-color:4.4.0"

inherit node-module

SLOT="0"

DESCRIPTION="Simple, flexible, fun test framework"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( CHANGELOG.md README.md )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/mocha" "/usr/bin/mocha"
}
