# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="aes.js authCipher.js browser.js decrypter.js encrypter.js ghash.js modes modes.js populateFixtures.js streamCipher.js"
NODE_MODULE_DEPEND="buffer-xor:1.0.3
	cipher-base:1.0.2
	create-hash:1.1.2
	evp_bytestokey:1.0.0
	inherits:2.0.1"

inherit node-module

DESCRIPTION="Aes, for browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
