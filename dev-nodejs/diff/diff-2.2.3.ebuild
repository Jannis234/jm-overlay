# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.3.1"
NODE_MODULE_EXTRA_FILES="runtime.js dist"

inherit node-module

DESCRIPTION="A javascript text diff implementation"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md CONTRIBUTING.md release-notes.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples images
}
