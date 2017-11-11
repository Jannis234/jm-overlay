# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="istanbul-lib-coverage:1.1.1
	mkdirp:0.5.1
	path-parse:1.0.5
	supports-color:3.2.3"

inherit node-module

DESCRIPTION="Base reporting library for istanbul"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
