# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="babel-runtime:6.11.6"

inherit node-module

DESCRIPTION="Collection of debug messages used by Babel"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
