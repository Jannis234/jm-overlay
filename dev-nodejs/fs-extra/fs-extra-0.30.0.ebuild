# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="path-is-absolute:1.0.0
	jsonfile:2.3.0
	klaw:1.2.0
	graceful-fs:4.1.3
	rimraf:2.5.2"

inherit node-module

DESCRIPTION="Contains methods that aren't included in the vanilla Node.js fs package"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGELOG.md )
