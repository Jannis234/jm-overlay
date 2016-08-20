# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="strip-ansi:3.0.1
	ansi-regex:2.0.0
	ansi-escapes:1.4.0
	rx-lite:3.1.2
	through:2.3.8
	cli-width:1.1.1
	figures:1.7.0
	chalk:1.1.3
	readline2:1.0.1
	cli-cursor:1.0.2
	run-async:0.1.0
	lodash:3.10.1"

inherit node-module

DESCRIPTION="A collection of common interactive command line user interfaces"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
