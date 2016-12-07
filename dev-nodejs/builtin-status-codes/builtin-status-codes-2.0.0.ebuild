# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"

inherit node-module

DESCRIPTION="The map of HTTP status codes from the builtin http module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="net-libs/nodejs"
DOCS=( readme.md )

src_compile() {
	node build.js || die
}
