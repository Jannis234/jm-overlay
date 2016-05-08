# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_EXTRA_FILES="main.js"
NODE_MODULE_DEPEND="process:0.11.3"

inherit node-module

DESCRIPTION="Timers module for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
