# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="node.js src"
NODE_MODULE_DEPEND="ms:2.0.0"

inherit node-module

DESCRIPTION="Small debugging utility"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( CHANGELOG.md README.md )

src_compile() { :; }
