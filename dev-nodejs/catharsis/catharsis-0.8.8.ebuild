# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_DEPEND="underscore-contrib:0.3.0"
NODE_MODULE_EXTRA_FILES="res"

inherit node-module

DESCRIPTION="A JavaScript parser for Google Closure Compiler and JSDoc type expressions"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
