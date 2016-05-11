# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="default-input.js"
NODE_MODULE_DEPEND="semver:5.1.0
	validate-npm-package-name:2.2.2
	validate-npm-package-license:3.0.1
	promzard:0.3.0
	read:1.0.7
	npm-package-arg:4.1.1
	glob:6.0.4
	read-package-json:2.0.4"

inherit node-module

DESCRIPTION="A node module to get your node module started"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
