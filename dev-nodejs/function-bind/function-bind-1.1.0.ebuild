# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="implementation.js"

inherit node-module

DESCRIPTION="Implementation of Function.prototype.bind"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
