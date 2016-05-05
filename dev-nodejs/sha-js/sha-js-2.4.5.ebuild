# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="sha.js"
NODE_MODULE_EXTRA_FILES="hash.js hexpp.js sha.js sha1.js sha224.js sha256.js sha384.js sha512.js"
NODE_MODULE_DEPEND="inherits:2.0.1"

inherit node-module

DESCRIPTION="Streamable SHA hashes in pure javascript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
