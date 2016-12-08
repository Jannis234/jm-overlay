# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12"
NODE_MODULE_EXTRA_FILES="es2015 source"
NODE_MODULE_DEPEND="ansicolors:0.3.2
	diff:2.2.3
	editions:1.3.3"

inherit node-module

DESCRIPTION="Common utilities and helpers to make testing assertions easier"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md HISTORY.md )

src_install() {
	node-module_src_install
	use doc && dodoc -r docs
}
