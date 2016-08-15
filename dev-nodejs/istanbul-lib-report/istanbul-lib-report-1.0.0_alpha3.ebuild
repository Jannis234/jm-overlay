# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="path-parse:1.0.5
	istanbul-lib-coverage:1.0.0
	async:1.5.2
	supports-color:3.1.2
	mkdirp:0.5.1
	rimraf:2.5.4"

inherit node-module

SLOT="1.0.0-alpha.3"
SRC_URI="http://registry.npmjs.org/${PN}/-/${PN}-${SLOT}.tgz"

DESCRIPTION="Base reporting library for istanbul"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md )

src_install() {
	node-module_src_install
	docinto html
	use doc && dodoc -r docs/*
}
