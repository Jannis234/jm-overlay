# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="source-map:0.4.4"

inherit node-module

DESCRIPTION="Adds source mappings and base64 encodes them"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
