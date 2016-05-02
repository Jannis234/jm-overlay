# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_EXTRA_FILES="queue.js"

inherit node-module

DESCRIPTION="A library for promises (CommonJS/Promises/A,B,D)"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGES.md )
