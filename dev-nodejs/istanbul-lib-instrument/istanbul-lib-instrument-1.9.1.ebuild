# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="dist"
NODE_MODULE_DEPEND="babel-generator:6.26.0
	babel-template:6.26.0
	babel-traverse:6.26.0
	babel-types:6.26.0
	babylon:6.18.0
	istanbul-lib-coverage:1.1.1
	semver:5.4.1"

inherit node-module

DESCRIPTION="Core istanbul API for JS code coverage"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
