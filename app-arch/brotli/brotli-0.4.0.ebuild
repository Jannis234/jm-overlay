# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy )

inherit distutils-r1

DESCRIPTION="Generic-purpose lossless compression algorithm"
HOMEPAGE="https://github.com/google/brotli"
SRC_URI="https://github.com/google/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+tools doc test"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( dev-lang/python )"

DOCS="README.md CONTRIBUTING.md"
BROTLI_DRAFT_FILENAME="draft-alakuijala-brotli-11"

src_compile() {
	distutils-r1_src_compile

	if use tools || use test; then
		cd tools || die
		emake
		cd .. || die
	fi

	if use doc; then
		python tools/rfc-format.py docs/${BROTLI_DRAFT_FILENAME}.nroff > docs/${BROTLI_DRAFT_FILENAME}.txt || die
	fi
}

src_install() {
	distutils-r1_src_install

	use tools && dobin tools/bro
	if use doc; then
		dodoc docs/${BROTLI_DRAFT_FILENAME}.txt
		dodoc docs/brotli-comparison-study-2015-09-22.pdf
	fi
}

src_test() {
	cd tests || die
	emake
}
