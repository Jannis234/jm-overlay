# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="pinkie-promise:2.0.1"

inherit node-module

DESCRIPTION="Check if a path exists"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
