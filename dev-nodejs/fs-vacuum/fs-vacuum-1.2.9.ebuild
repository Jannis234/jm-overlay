# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="vacuum.js"
NODE_MODULE_DEPEND="path-is-inside:1.0.1
	graceful-fs:4.1.3
	rimraf:2.5.2"

inherit node-module

DESCRIPTION="Recursively remove empty directories -- to a point"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
