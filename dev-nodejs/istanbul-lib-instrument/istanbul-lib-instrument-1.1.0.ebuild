# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="dist"
NODE_MODULE_DEPEND="istanbul-lib-coverage:1.0.0
	babylon:6.8.4
	babel-types:6.13.0
	babel-generator:6.11.4
	babel-template:6.9.0
	babel-traverse:6.13.0"

inherit node-module

DESCRIPTION="Core istanbul API for JS code coverage"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
