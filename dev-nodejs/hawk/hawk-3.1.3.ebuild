# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="dist"
NODEJS_MIN_VERSION="0.10.32"
NODE_MODULE_DEPEND="cryptiles:2.0.5
	boom:2.10.1
	sntp:1.0.9
	hoek:2.16.3"

inherit node-module

DESCRIPTION="HTTP Hawk Authentication Scheme"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
