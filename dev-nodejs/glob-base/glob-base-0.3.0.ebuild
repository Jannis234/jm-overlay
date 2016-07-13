# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="glob-parent:2.0.0
	is-glob:2.0.1"

inherit node-module

DESCRIPTION="Returns an object with the (non-glob) base path and the actual pattern"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
