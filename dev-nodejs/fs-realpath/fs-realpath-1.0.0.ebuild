# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="fs.realpath"
NODE_MODULE_EXTRA_FILES="old.js"

inherit node-module

DESCRIPTION="Node's fs.realpath, fall back to the JS implementation if the native one fails"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
