# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12.0"
NODE_MODULE_DEPEND="estraverse:1.9.3
	esutils:2.0.2
	esprima:2.7.2
	source-map:0.2.0"

inherit node-module

DESCRIPTION="ECMAScript code generator"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
