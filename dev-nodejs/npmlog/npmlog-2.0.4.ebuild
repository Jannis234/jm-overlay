# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="log.js"
NODE_MODULE_DEPEND="ansi:0.3.1
	gauge:1.2.7
	are-we-there-yet:1.1.2"

inherit node-module

DESCRIPTION="Logger for npm"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
