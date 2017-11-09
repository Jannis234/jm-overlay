# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="browser-source-map-support.js register.js"
NODE_MODULE_DEPEND="source-map:0.5.7"

inherit node-module

DESCRIPTION="Fixes stack traces for files with source maps"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
