# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="debug:3.1.0
	istanbul-lib-coverage:1.1.1
	mkdirp:0.5.1
	rimraf:2.6.2
	source-map:0.5.7"

inherit node-module

DESCRIPTION="Source maps support for istanbul"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
