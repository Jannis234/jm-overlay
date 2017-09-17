# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="find-up:1.1.2"

inherit node-module

DESCRIPTION="Find the root directory of a npm package"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
