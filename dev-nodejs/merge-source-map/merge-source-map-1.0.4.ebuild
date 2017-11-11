# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="source-map:0.5.7"

inherit node-module

DESCRIPTION="Merge old source map and new source map in multi-transform flow"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
