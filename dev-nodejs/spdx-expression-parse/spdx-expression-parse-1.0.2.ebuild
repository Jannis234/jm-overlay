# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="parser.generated.js"
NODE_MODULE_DEPEND="spdx-exceptions:1.0.4
	spdx-license-ids:1.2.1"

inherit node-module

DESCRIPTION="Parse SPDX license expressions"

LICENSE="MIT CC-BY-3.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
