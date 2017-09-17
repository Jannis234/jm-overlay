# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="${PN}_browser.js"

inherit node-module

DESCRIPTION="Browser-friendly inheritance fully compatible with standard node.js inherits()"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
