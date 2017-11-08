# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="duplex.js duplex-browser.js passthrough.js readable.js readable-browser.js transform.js writable.js writable-browser.js"
NODE_MODULE_DEPEND="core-util-is:1.0.2
	inherits:2.0.3
	isarray:1.0.0
	process-nextick-args:1.0.7
	safe-buffer:5.1.1
	string_decoder:1.0.3
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
