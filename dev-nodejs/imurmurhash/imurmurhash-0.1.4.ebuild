# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.19"
NODE_MODULE_EXTRA_FILES="${PN}.min.js"

inherit node-module

DESCRIPTION="An incremental implementation of MurmurHash3"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
