# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="auto-bind.js lazy.js"
NODE_MODULE_DEPEND="es5-ext:0.10.12"

inherit node-module

DESCRIPTION="Property descriptor factory"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES )
