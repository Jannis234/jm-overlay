# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="duplexer2:0.0.2
	through2:0.5.1"

inherit node-module

DESCRIPTION="This is a sequel to stream-combiner for streams2"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
