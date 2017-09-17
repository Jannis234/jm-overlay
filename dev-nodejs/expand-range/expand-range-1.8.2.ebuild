# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="fill-range:2.2.3"

inherit node-module

DESCRIPTION="Fast, bash-like range expansion"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
