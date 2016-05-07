# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="immutable.js mutable.js"

inherit node-module

DESCRIPTION="Extend like a boss"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_compile() { :; }
