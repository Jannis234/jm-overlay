# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12"
NODE_MODULE_EXTRA_FILES="es2015 source"
NODE_MODULE_DEPEND="editions:1.3.3
	typechecker:4.4.0"

inherit node-module

DESCRIPTION="Execute a function ambidextrously"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )
