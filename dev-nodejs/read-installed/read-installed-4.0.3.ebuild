# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="debuglog:1.0.1
	util-extend:1.0.3
	graceful-fs:4.1.3
	slide:1.1.6
	semver:5.1.0
	readdir-scoped-modules:1.0.2
	read-package-json:2.0.4"

inherit node-module

DESCRIPTION="Read all installed packages in a folder, return a tree structure with the data"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
