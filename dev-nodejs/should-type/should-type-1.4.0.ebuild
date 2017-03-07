# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="cjs es6"

inherit node-module

DESCRIPTION="Simple module to get instance type. Like a bit more advanced version of typeof"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
