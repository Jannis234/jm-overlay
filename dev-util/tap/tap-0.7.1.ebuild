# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_DEPEND="inherits:2.0.1
	buffer-equal:0.0.2
	slide:1.1.6
	deep-equal:1.0.1
	yamlish:0.0.7
	nopt:3.0.6
	mkdirp:0.5.1
	difflet:0.2.6
	glob:4.5.3
	runforcover:0.0.2"

inherit node-module

SLOT="0.7"

DESCRIPTION="A Test-Anything-Protocol library"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md AUTHORS )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/tap.js" "/usr/bin/tap-0.7"
	use examples && dodoc -r example
}

src_test() {
	node-module_src_test
	node bin/tap.js test/*.* || die "Tests failed"
}
