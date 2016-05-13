# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="bin"

inherit node-module

SLOT="0"

DESCRIPTION="Parser generator for JavaScript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/pegjs" "/usr/bin/pegjs"
	use examples && dodoc -r examples
}
