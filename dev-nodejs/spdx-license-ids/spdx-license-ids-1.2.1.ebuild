# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="${PN}.json"

inherit node-module

DESCRIPTION="A list of SPDX license identifiers"

LICENSE="Unlicense"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
