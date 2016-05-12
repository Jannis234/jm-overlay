# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="cryptiles:0.2.2
	boom:0.4.2
	sntp:0.2.4
	hoek:0.9.1"

inherit node-module

DESCRIPTION="HTTP Hawk Authentication Scheme"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_compile() { :; }

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
