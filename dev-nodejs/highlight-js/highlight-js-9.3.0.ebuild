# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="highlight.js"
NODE_MODULE_EXTRA_FILES="styles"

inherit node-module

DESCRIPTION="Syntax highlighting with language autodetection"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md )

src_install() {
	node-module_src_install
	docinto rst
	use doc && dodoc docs/*
}
