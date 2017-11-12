# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4"
NODE_MODULE_DEPEND="execa:0.7.0
	lcid:1.0.0
	mem:1.1.0"

inherit node-module

DESCRIPTION="Get the system locale"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
