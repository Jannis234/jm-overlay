# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="inherits:2.0.1
	defined:0.0.0
	resumer:0.0.0
	deep-equal:0.2.2
	through:2.3.8
	object-inspect:0.4.0
	glob:3.2.11"

inherit node-module

DESCRIPTION="Tap-producing test harness for node and browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
