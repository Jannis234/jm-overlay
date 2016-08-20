# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_NAME="des.js"
NODE_MODULE_DEPEND="minimalistic-assert:1.0.0
	inherits:2.0.1"

inherit node-module

DESCRIPTION="DES implementation"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
