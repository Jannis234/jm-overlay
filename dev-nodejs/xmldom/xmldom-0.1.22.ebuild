# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.1"
NODE_MODULE_EXTRA_FILES="dom.js dom-parser.js __package__.js sax.js"

inherit node-module

DESCRIPTION="A W3C Standard XML DOM implementation and parser"

LICENSE="|| ( MIT LGPL-2+ )"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
