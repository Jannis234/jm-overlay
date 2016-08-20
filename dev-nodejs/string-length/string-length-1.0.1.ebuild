# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="strip-ansi:3.0.1"
NODEJS_MIN_VERSION="0.10.0"

inherit node-module

DESCRIPTION="Get the real length of a string"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
