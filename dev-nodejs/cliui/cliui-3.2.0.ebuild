# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="wrap-ansi:2.0.0
	strip-ansi:3.0.1
	string-width:1.0.1"

inherit node-module

DESCRIPTION="Easily create complex multi-column command-line-interfaces"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGELOG.md )
