# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="${PN}.json"

inherit node-module

DESCRIPTION="List of node.js builtin modules"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( Readme.md History.md )
