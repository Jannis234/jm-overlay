# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_EXTRA_FILES="cli.js node plugins templates conf.json.EXAMPLE"
NODE_MODULE_DEPEND="escape-string-regexp:1.0.5
	async:1.4.2
	taffydb:2.6.2
	strip-json-comments:1.0.4
	underscore:1.8.3
	marked:0.3.5
	wrench:1.5.9
	js2xmlparser:1.0.0
	espree:2.2.5
	requizzle:0.2.1
	bluebird:2.9.34
	catharsis:0.8.8"

inherit node-module

SLOT="0"

DESCRIPTION="An API documentation generator for JavaScript"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CONTRIBUTING.md CHANGES.md )

src_install() {
	node-module_src_install
	install_node_module_binary "jsdoc.js" "/usr/bin/jsdoc"
}
