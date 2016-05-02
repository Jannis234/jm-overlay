# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="src"
NODE_MODULE_DEPEND="pako:0.2.8"

inherit node-module

DESCRIPTION="Full zlib module for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
