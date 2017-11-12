# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_DEPEND="bind-obj-methods:1.0.0
	bluebird:3.5.1
	clean-yaml-object:0.1.0
	color-support:1.1.3
	coveralls:2.13.3
	foreground-child:1.5.6
	fs-exists-cached:1.0.0
	function-loop:1.0.1
	glob:7.1.2
	isexe:2.0.0
	js-yaml:3.10.0
	nyc:11.3.0
	opener:1.4.3
	os-homedir:1.0.2
	own-or:1.0.0
	own-or-env:1.0.0
	readable-stream:2.3.3
	signal-exit:3.0.2
	source-map-support:0.4.18
	stack-utils:1.0.1
	tap-mocha-reporter:3.0.6
	tap-parser:5.4.0
	tmatch:3.1.0
	trivial-deferred:1.0.1
	tsame:1.1.2
	yapool:1.0.0"

inherit node-module

SLOT="0"

DESCRIPTION="A Test-Anything-Protocol library"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/run.js" "/usr/bin/tap"
}
