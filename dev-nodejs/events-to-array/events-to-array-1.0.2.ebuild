# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="etoa.js"

inherit node-module

DESCRIPTION="Put a bunch of emitted events in an array, for testing"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
