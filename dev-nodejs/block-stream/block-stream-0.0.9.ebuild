# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="inherits:2.0.1"

inherit node-module

RDEPEND="dev-nodejs/inherits:2.0.1
	|| ( =net-libs/nodejs-0.4* >=net-libs/nodejs-0.5.8 )"

DESCRIPTION="A stream of blocks"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
