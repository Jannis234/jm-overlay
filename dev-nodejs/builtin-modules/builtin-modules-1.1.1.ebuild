# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="${PN}.json static.js"

inherit node-module

DESCRIPTION="List of the Node.js builtin modules"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
