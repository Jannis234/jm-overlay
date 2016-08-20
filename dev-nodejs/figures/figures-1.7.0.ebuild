# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="object-assign:4.1.0
	escape-string-regexp:1.0.5"

inherit node-module

DESCRIPTION="Unicode symbols with Windows CMD fallbacks"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
