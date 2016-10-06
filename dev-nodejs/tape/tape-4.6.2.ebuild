# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="deep-equal:1.0.1
	defined:1.0.0
	function-bind:1.1.0
	glob:7.1.0
	has:1.0.1
	inherits:2.0.3
	minimist:1.2.0
	object-inspect:1.2.1
	resolve:1.1.7
	resumer:0.0.0
	through:2.3.8"

inherit node-module

DESCRIPTION="Tap-producing test harness for node and browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="${RDEPEND}
	dev-nodejs/string-prototype-trim:1.1.2"
DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	install_node_module_depend "string.prototype.trim:1.1.2"
	use examples && dodoc -r example
}
