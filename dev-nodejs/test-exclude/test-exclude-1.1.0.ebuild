# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="arrify:1.0.1
	require-main-filename:1.0.1
	micromatch:2.3.10
	read-pkg-up:1.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-assign:4.0.9"

DESCRIPTION="Test for inclusion or exclusion of paths using pkg-conf and globs"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.assign:4.0.9"
}
