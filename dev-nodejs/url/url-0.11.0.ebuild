# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="util.js"
NODE_MODULE_DEPEND="punycode:1.3.2
	querystring:0.2.0"

inherit node-module

DESCRIPTION="The core url packaged standalone for use with Browserify"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
