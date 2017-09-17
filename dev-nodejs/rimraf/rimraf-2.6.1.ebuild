# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="glob:7.1.1"

inherit node-module

DESCRIPTION="A deep deletion module for node (like rm -rf)"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
