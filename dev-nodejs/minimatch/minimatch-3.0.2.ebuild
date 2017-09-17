# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="brace-expansion:1.1.5"

inherit node-module

DESCRIPTION="A glob matcher in javascript"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
