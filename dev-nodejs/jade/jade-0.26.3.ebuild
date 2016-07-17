# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="jade.min.js runtime.js runtime.min.js"
NODE_MODULE_DEPEND="mkdirp:0.3.0"

inherit node-module

DESCRIPTION="Jade template engine"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="${DEPEND}
	dev-util/uglifyjs"

src_compile() {
	uglifyjs -c -o jade.min.js jade.js || die
	uglifyjs -c -o runtime.min.js runtime.js || die
}

src_install() {
	node-module_src_install
	use doc && dodoc jade.md
}
