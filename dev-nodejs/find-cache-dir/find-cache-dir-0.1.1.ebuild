# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="commondir:1.0.1
	mkdirp:0.5.1
	pkg-dir:1.0.0"

inherit node-module

DESCRIPTION="Finds the common standard cache directory"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
