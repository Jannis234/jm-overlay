# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="misc rng.js rng-browser.js"

inherit node-module

DESCRIPTION="Rigorous implementation of RFC4122 (v1 and v4) UUIDs"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
