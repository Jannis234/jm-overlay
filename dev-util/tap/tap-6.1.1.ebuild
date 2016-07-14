# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_DEPEND="os-homedir:1.0.1
	clean-yaml-object:0.1.0
	stack-utils:0.4.0
	opener:1.4.1
	supports-color:1.3.1
	isexe:1.1.2
	only-shallow:1.2.0
	deeper:2.1.0
	tmatch:2.0.1
	tap-parser:1.2.2
	signal-exit:2.1.2
	readable-stream:2.1.4
	bluebird:3.4.1
	glob:7.0.5
	foreground-child:1.5.3
	js-yaml:3.6.1
	coveralls:2.11.11
	tap-mocha-reporter:0.0.25
	nyc:6.6.1"

inherit node-module

SLOT="0"

DESCRIPTION="A Test-Anything-Protocol library"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install

	install_node_module_binary "bin/run.js" "/usr/bin/tap"
}
