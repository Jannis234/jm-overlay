# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="buffer-stream.js"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Get a stream as a string, buffer, or array"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
