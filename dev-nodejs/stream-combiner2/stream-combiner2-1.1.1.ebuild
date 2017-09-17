# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="duplexer2:0.1.4
	readable-stream:2.2.2"

inherit node-module

DESCRIPTION="This is a sequel to stream-combiner for streams2"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
