# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="core-js core-js.js helpers regenerator"
NODE_MODULE_DEPEND="regenerator-runtime:0.11.0
	core-js:2.5.1"

inherit node-module

DESCRIPTION="Babel selfContained runtime"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
