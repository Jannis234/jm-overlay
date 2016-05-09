# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js node.js"
NODE_MODULE_DEPEND="ms:0.7.1"

inherit node-module

DESCRIPTION="Small debugging utility"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( Readme.md History.md )

src_compile() { :; }
