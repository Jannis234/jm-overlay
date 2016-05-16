# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="progress-bar.js"
NODE_MODULE_DEPEND="has-unicode:2.0.0
	ansi:0.3.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-pad:4.4.0
	dev-nodejs/lodash-padstart:4.5.0
	dev-nodejs/lodash-padend:4.5.0"

DESCRIPTION="A terminal based horizontal guage"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.pad:4.4.0"
	install_node_module_depend "lodash.padstart:4.5.0"
	install_node_module_depend "lodash.padend:4.5.0"
	use examples && dodoc example.png
}
