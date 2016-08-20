# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.5.8"
NODE_MODULE_DEPEND="inherits:2.0.1"

inherit node-module

DESCRIPTION="A stream of blocks"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
