# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="duplex.js passthrough.js readable.js transform.js writable.js"
NODE_MODULE_DEPEND="core-util-is:1.0.2"

inherit node-module

DESCRIPTION="Streams2, a user-land copy of the stream library from Node.js v0.10.x"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
