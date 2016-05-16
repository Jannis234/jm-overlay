# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIB_VERSION="0.6"
NODE_MODULE_EXTRA_FILES="dist"

inherit node-module

DESCRIPTION="A querystring parser that supports nesting and arrays, with a depth limit"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CONTRIBUTING.md CHANGELOG.md )
