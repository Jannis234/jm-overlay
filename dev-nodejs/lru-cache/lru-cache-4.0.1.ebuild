# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="pseudomap:1.0.2
	yallist:2.0.0"

inherit node-module

DESCRIPTION="A cache object that deletes the least-recently-used items"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
