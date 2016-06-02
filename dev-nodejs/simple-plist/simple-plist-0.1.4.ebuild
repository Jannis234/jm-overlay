# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="bplist-parser:0.0.6
	bplist-creator:0.0.4
	plist:1.2.0"

inherit node-module

DESCRIPTION="A wrapper utility for interacting with plist data"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
