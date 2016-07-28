# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_DEPEND="estraverse:0.0.4
	esprima:1.0.4
	source-map:0.5.6"
NODE_MODULE_EXTRA_FILES="escodegen.browser.js"

inherit node-module

DESCRIPTION="ECMAScript code generator"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
