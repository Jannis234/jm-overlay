# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="path-key:2.0.1"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Get your PATH prepended with locally installed binaries"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
