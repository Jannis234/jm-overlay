# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4"
NODE_MODULE_DEPEND="locate-path:2.0.0"

inherit node-module

DESCRIPTION="Find a file by walking up parent directories"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
