# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="inherits:2.0.1
	graceful-fs:4.1.3
	mkdirp:0.5.1
	rimraf:2.5.2"

inherit node-module

DESCRIPTION="Advanced file system stream things"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
