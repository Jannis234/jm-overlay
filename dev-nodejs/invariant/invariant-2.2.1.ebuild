# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"
NODE_MODULE_DEPEND="loose-envify:1.2.0"

inherit node-module

DESCRIPTION="Provide descriptive errors in development but generic errors in production"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
