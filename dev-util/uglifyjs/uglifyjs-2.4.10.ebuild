# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="async:0.2.10
	source-map:0.1.34
	uglify-to-browserify:1.0.2
	yargs:1.3.3"
NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_EXTRA_FILES="bin tools"

inherit node-module

DESCRIPTION="JavaScript parser, mangler/compressor and beautifier toolkit"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

SLOT="0"
DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/uglifyjs" "/usr/bin/uglifyjs"
}
