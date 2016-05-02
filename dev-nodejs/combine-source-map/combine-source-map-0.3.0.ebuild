# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="convert-source-map:0.3.5
	inline-source-map:0.3.1
	source-map:0.1.43"

inherit node-module

DESCRIPTION="Add source maps of files, offset them and combine them into one source map"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
