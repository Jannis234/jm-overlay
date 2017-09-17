# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="type-detect:0.1.1"

inherit node-module

DESCRIPTION="Improved deep equality testing for Node.js and the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md History.md )
