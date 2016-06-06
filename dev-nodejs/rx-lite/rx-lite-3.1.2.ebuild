# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="rx.lite.js rx.lite.map rx.lite.min.js"

inherit node-module

DEPEND="dev-util/uglifyjs"

DESCRIPTION="Lightweight library for composing asynchronous and event-based operations"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )

src_compile() {
	head -n 1 rx.lite.js > copyright_banner || die
	uglifyjs -c -m --source-map rx.lite.map --preamble "$(cat copyright_banner)" -o rx.lite.min.js rx.lite.js || die
}
