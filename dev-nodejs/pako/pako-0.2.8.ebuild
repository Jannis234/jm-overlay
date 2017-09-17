# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="dist"

inherit node-module

DESCRIPTION="zlib port to javascript - fast, modularized, with browser support"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md HISTORY.md )

src_install() {
	node-module_src_install
	use doc && dodoc doc/*
}
