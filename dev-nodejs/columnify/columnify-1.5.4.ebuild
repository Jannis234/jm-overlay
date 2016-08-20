# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="utils.js width.js"
NODE_MODULE_DEPEND="strip-ansi:3.0.1
	wcwidth:1.0.0"

inherit node-module

DESCRIPTION="Render data in text columns. Supports in-column text-wrap"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( Readme.md )

src_compile() { :; }
