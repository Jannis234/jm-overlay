# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser-${PN}.js browser-raw.js raw.js"

inherit node-module

DESCRIPTION="High-priority task queue for Node.js and browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGES.md )
