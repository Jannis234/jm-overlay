# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="hash.js"
NODE_MODULE_DEPEND="inherits:2.0.1"

inherit node-module

DESCRIPTION="Various hash functions that could be run by both browser and node"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
