# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="p-limit:1.1.0"

inherit node-module

DESCRIPTION="Get the first fulfilled promise that satisfies the provided testing function"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
