# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="ie8-polyfill.js"
NODE_MODULE_DEPEND="builtin-status-codes:2.0.0
	inherits:2.0.3
	readable-stream:2.2.2
	to-arraybuffer:1.0.1
	xtend:4.0.1"

inherit node-module

DESCRIPTION="Streaming http in the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
