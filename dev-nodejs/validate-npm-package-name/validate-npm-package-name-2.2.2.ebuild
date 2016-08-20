# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="builtins:0.0.7"

inherit node-module

DESCRIPTION="Give me a string and I'll tell you if it's a valid npm package name"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
