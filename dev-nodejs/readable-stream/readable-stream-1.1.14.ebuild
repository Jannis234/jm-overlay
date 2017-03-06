# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="duplex.js passthrough.js readable.js transform.js writable.js"
NODE_MODULE_DEPEND="core-util-is:1.0.2
	isarray:0.0.1
	string_decoder:0.10.31
	inherits:2.0.3"

inherit node-module

DESCRIPTION="Streams3, a user-land copy of the stream library from Node.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
