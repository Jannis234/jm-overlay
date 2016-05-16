# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="dezalgo:1.0.3
	npm-package-arg:4.1.1"

inherit node-module

DESCRIPTION="Like npm-package-arg, but more so, producing full file paths"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
