# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="builtin-modules:1.1.1"

inherit node-module

DESCRIPTION="Check if a string matches the name of a Node.js builtin module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
