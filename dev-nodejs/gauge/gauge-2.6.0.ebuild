# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="has-color:0.1.7
	aproba:1.0.4
	has-unicode:2.0.1
	object-assign:4.1.0
	console-control-strings:1.1.0
	wide-align:1.1.0
	signal-exit:3.0.0
	strip-ansi:3.0.1
	string-width:1.0.2"

inherit node-module

DESCRIPTION="A terminal based horizontal guage"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	doins *.js
}
