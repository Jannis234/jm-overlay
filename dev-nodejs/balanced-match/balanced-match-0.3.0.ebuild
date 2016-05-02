# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit node-module

DESCRIPTION="Match balanced character pairs, like \"{\" and \"}\""

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_compile() { :; }

src_install() {
	node-module_src_install
	use examples && dodoc example.js
}
