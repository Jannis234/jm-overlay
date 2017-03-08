# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="duplex.js passthrough.js readable.js transform.js writable.js"
NODE_MODULE_DEPEND="buffer-shims:1.0.0
	core-util-is:1.0.2
	inherits:2.0.3
	isarray:1.0.0
	process-nextick-args:1.0.7
	string_decoder:0.10.31
	util-deprecate:1.0.2"

inherit node-module

DESCRIPTION="Streams3, a user-land copy of the stream library from Node.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md CONTRIBUTING.md GOVERNANCE.md )

src_install() {
	node-module_src_install
	use doc && dodoc -r doc/*
}
