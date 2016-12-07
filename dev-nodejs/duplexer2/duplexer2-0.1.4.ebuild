# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="readable-stream:2.2.2"

inherit node-module

DESCRIPTION="Like duplexer but using streams2"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
