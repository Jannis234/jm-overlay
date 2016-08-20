# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.40"
NODE_MODULE_DEPEND="boom:2.10.1"

inherit node-module

DESCRIPTION="General purpose crypto utilities"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
