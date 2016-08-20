# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="extend.js"

inherit node-module

DESCRIPTION="Node's internal object extension function"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
