# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="mute.js"

inherit node-module

DESCRIPTION="Bytes go in, but they don't come out (when muted)"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
