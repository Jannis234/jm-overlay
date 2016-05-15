# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="ini:1.3.4
	proto-list:1.2.4"

inherit node-module

DESCRIPTION="Handle configuration once and for all"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.markdown )
