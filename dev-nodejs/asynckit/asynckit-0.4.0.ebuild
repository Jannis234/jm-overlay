# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="bench.js parallel.js serial.js serialOrdered.js stream.js"

inherit node-module

DESCRIPTION="Minimal async jobs utility library, with streams support"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
