# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="co:4.6.0
	fast-deep-equal:1.1.0
	fast-json-stable-stringify:2.0.0
	json-schema-traverse:0.3.1"
NODE_MODULE_EXTRA_FILES="dist"

inherit node-module

DESCRIPTION="Another JSON Schema Validator"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
