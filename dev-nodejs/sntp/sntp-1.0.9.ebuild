# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="hoek:2.16.3"

inherit node-module

DESCRIPTION="SNTP Client"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_compile() { :; }

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
