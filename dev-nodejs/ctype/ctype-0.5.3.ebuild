# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="ctf.js ctio.js"

inherit node-module

DESCRIPTION="Read and write binary structures and data types"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README CHANGELOG )

src_install() {
	node-module_src_install
	newman "man/man3ctype/ctio.3ctype" "ctio.3"
}
