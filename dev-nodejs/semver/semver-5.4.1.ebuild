# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="range.bnf"

inherit node-module

DESCRIPTION="The semantic version parser used by npm"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
