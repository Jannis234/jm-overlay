# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="underscore:1.2.1"

inherit node-module

DESCRIPTION="Simple dependency graph management"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-lang/coffee-script
	doc? ( app-doc/docco )"

DOCS=( README.mdown )

src_compile() {
	coffee -c -o lib src || die
	if use doc; then
		rm -rf docs || die
		docco src/*.coffee || die
	fi
}

src_install() {
	node-module_src_install
	docinto html
	use doc && dodoc -r docs/*
}
