# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit node-module

DESCRIPTION="Parses JavaScript objects into XML"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md CHANGES.md NOTICE.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
