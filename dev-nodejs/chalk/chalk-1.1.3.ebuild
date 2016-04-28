# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="ansi-styles:2.2.1
	escape-string-regexp:1.0.5
	has-ansi:2.0.0
	strip-ansi:3.0.1
	supports-color:2.0.0"

inherit node-module

DESCRIPTION="Terminal string styling done right. Much color."

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
