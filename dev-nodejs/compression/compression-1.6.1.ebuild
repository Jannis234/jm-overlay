# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="on-headers:1.0.1
	bytes:2.2.0
	vary:1.1.0
	compressible:2.0.7
	debug:2.2.0
	accepts:1.3.2"

inherit node-module

DESCRIPTION="Node.js compression middleware"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )
