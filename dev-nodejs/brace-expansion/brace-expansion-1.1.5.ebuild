# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="balanced-match:0.4.1
	concat-map:0.0.1"

inherit node-module

DESCRIPTION="Brace expansion as known from sh/bash"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
