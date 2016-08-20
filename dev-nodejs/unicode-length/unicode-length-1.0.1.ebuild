# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="build"
NODE_MODULE_DEPEND="punycode:1.4.1
	strip-ansi:3.0.1"

inherit node-module

DESCRIPTION="Get the length of unicode strings"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
