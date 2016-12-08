# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="out"
NODE_MODULE_DEPEND="cli-color:0.2.3"

inherit node-module

DESCRIPTION="Console Reporter for the Joe Testing Framework"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
