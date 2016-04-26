# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.2"
NODE_MODULE_EXTRA_FILES="intercept.js"

inherit node-module

DESCRIPTION="Provide AMD's define() API for declaring modules in the AMD format"

LICENSE="MIT BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
