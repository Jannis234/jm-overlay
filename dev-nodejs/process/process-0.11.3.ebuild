# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_EXTRA_FILES="browser.js"

inherit node-module

DESCRIPTION="Process information for node.js and browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
