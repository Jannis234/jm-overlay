# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.1.103"
NODE_MODULE_DEPEND="es5-ext:0.9.2
	memoizee:0.2.6"

inherit node-module

DESCRIPTION="Colors, formatting and other tools for the console"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES )

src_compile() { :; }
