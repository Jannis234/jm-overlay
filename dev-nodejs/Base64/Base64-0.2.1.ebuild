# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="base64.js base64.min.js"

inherit node-module

DESCRIPTION="Base64 encoding and decoding"

LICENSE="WTFPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/uglifyjs"
DOCS=( README.md )

src_prepare() {
	default
	rm base64.min.js || die
}

src_compile() {
	emake UGLIFYJS=uglifyjs
}
