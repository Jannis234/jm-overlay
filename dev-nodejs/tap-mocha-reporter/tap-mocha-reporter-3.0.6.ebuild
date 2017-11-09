# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="color-support:1.1.3
	debug:2.6.9
	diff:1.4.0
	escape-string-regexp:1.0.5
	glob:7.1.2
	js-yaml:3.10.0
	readable-stream:2.3.3
	tap-parser:5.4.0
	unicode-length:1.0.3"

inherit node-module

DESCRIPTION="Format a TAP stream using Mocha's set of reporters"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
