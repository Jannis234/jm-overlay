# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_EXTRA_FILES="tools"
NODE_MODULE_DEPEND="uglify-to-browserify:1.0.2
	source-map:0.5.7"

inherit node-module

DESCRIPTION="JavaScript parser, mangler/compressor and beautifier toolkit"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
