# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="inherits:2.0.1
	readable-stream:1.1.14"

inherit node-module

DESCRIPTION="The stream module from node core for browsers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.markdown )
