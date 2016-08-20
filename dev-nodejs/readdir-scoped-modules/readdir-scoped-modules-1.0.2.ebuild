# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="readdir.js"
NODE_MODULE_DEPEND="debuglog:1.0.1
	graceful-fs:4.1.3
	once:1.3.3
	dezalgo:1.0.3"

inherit node-module

DESCRIPTION="Like fs.readdir but handling @org/module dirs as if they were a single entry"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
