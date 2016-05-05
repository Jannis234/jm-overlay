# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"
NODE_MODULE_DEPEND="browserify-aes:1.0.6
	browserify-des:1.0.0
	evp_bytestokey:1.0.0"

inherit node-module

DESCRIPTION="Ciphers for the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
