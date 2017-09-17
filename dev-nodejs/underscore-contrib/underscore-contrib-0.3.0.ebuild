# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="underscore:1.6.0"
NODE_MODULE_EXTRA_FILES="dist"
UNDERSCORE_SCRIPTS="array.builders array.selectors collections.walk function.arity function.combinators function.dispatch function.iterators function.predicates object.builders object.selectors util.existential util.operators util.strings util.trampolines"
for i in $UNDERSCORE_SCRIPTS; do
	NODE_MODULE_EXTRA_FILES="${NODE_MODULE_EXTRA_FILES} underscore.${i}.js"
done

inherit node-module

DESCRIPTION="A contributors' library for underscore"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

DEPEND="dev-util/uglifyjs
	app-text/dos2unix
	doc? ( app-doc/docco )
	examples? ( app-doc/docco )"

DOCS=( README.md CONTRIBUTING.md CHANGELOG.md )

src_compile() {
	head -n 7 dist/${PN}.js > copyright_header.tmp || die
	dos2unix copyright_header.tmp || die
	dos2unix underscore.array.selectors.js || die

	cat copyright_header.tmp > dist/${PN}.js
	for i in $UNDERSCORE_SCRIPTS; do
		cat underscore.${i}.js >> dist/${PN}.js || die
	done
	uglifyjs dist/${PN}.js -m -c --preamble "$(cat copyright_header.tmp)" -o dist/${PN}.min.js || die

	if use doc; then
		docco docs/*.md -o docs_html || die
	fi
	if use examples; then
		docco examples/*.md -o examples_html || die
	fi
}

src_install() {
	node-module_src_install
	if use doc; then
		docinto html
		dodoc -r docs_html/*
	fi
	if use examples; then
		docinto examples
		dodoc -r examples_html/*
	fi
}
