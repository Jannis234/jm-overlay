# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bplistParser.js"
NODE_MODULE_DEPEND="big-integer:1.6.15"

inherit node-module

DESCRIPTION="Binary plist parser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
