# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="access.js mode.js windows.js"

inherit node-module

DESCRIPTION="Minimal module to check if a file is executable"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
