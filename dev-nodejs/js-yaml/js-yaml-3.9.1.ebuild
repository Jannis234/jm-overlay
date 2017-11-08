# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="esprima:4.0.0"
NODE_MODULE_EXTRA_FILES="dist"

inherit node-module

DESCRIPTION="YAML 1.2 parser and serializer"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
