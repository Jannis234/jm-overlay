# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit node-module

DESCRIPTION="Traverse and transform objects by visiting every node on a recursive walk"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
