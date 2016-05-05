# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="bn.js"
NODE_MODULE_EXTRA_FILES="util"

inherit node-module

DESCRIPTION="Big number implementation in pure javascript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
