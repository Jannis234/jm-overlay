# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_DEPEND="typedarray:0.0.6
	inherits:2.0.1
	readable-stream:1.1.14"

inherit node-module

DESCRIPTION="Stream that concatenates strings or binary data and calls a callback"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
