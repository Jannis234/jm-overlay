# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="lru-cache:4.0.1
	which:1.2.10"

inherit node-module

DESCRIPTION="Cross platform child_process#spawn"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
