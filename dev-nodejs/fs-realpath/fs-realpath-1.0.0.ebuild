# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_NAME="fs.realpath"
NODE_MODULE_EXTRA_FILES="old.js"

inherit node-module

DESCRIPTION="Node's fs.realpath, fall back to the JS implementation if the native one fails"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
