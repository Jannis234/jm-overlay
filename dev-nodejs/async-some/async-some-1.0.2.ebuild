# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="some.js"
NODE_MODULE_DEPEND="dezalgo:1.0.3"

inherit node-module

DESCRIPTION="Short-circuited, asynchronous version of Array.protototype.some"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
