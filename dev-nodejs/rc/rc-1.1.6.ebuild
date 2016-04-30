# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="browser.js"
NODE_MODULE_DEPEND="deep-extend:0.4.1
	ini:1.3.4
	minimist:1.2.0
	strip-json-comments:1.0.4"

inherit node-module

DESCRIPTION="Hardwired configuration loader"

LICENSE="|| ( BSD-2 MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
