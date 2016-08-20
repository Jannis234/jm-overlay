# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="esprima:2.7.2"
NODE_MODULE_EXTRA_FILES="dist"

inherit node-module

DESCRIPTION="YAML 1.2 parser and serializer"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-util/uglifyjs"

DOCS=( README.md CHANGELOG.md )

src_compile() {
	uglifyjs -c -m --preamble "$(head -n 1 dist/js-yaml.min.js)" -o dist/js-yaml.min.js dist/js-yaml.js || die
}
