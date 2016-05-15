# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="defaults:1.0.3"
NODE_MODULE_EXTRA_FILES="combining.js"

inherit node-module

DESCRIPTION="Port of C's wcwidth() and wcswidth()"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( Readme.md )

src_install() {
	node-module_src_install
	use doc && dodoc -r docs
}
