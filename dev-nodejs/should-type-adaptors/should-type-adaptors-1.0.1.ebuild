# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="cjs es6"
NODE_MODULE_DEPEND="should-type:1.4.0
	should-util:1.0.0"

inherit node-module

DESCRIPTION="Small utility functions to use the same traversing etc code on different types"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
