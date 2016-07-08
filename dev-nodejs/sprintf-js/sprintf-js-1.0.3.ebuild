# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="dist src"

inherit node-module

DESCRIPTION="JavaScript sprintf implementation"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-util/uglifyjs"

DOCS=( README.md )

src_compile() {
	head -n 1 dist/sprintf.min.js > banner || die
	rm dist/* || die

	for i in sprintf angular-sprintf; do
		uglifyjs -c -m --preamble "$(cat banner)" --source-map ${i}.min.map -o dist/${i}.min.js src/${i}.js || die
		mv ${i}.min.map dist/ || die
	done
}

src_install() {
	node-module_src_install

	use examples && dodoc -r demo
}
