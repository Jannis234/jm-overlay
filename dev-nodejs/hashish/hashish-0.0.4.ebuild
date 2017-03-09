# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.2.0"
NODE_MODULE_DEPEND="traverse:0.6.6"

inherit node-module

DESCRIPTION="Hash data structure manipulation functions"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
