# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="lodash-node:2.4.1"

inherit node-module

DESCRIPTION="An XML builder for node.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND="${RDEPEND}
	|| ( =net-libs/nodejs-0.8* >=net-libs/nodejs-0.10 )"

DOCS=( README.md )
