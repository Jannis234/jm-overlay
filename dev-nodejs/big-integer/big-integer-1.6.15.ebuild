# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
MyPN="BigInteger"
NODE_MODULE_EXTRA_FILES="${MyPN}.js ${MyPN}.min.js"

inherit node-module

DESCRIPTION="An arbitrary length integer library for Javascript"

LICENSE="public-domain"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
