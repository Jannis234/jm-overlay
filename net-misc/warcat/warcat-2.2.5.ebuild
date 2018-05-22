# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} pypy3 )
DISTUTILS_ALL_SUBPHASE_IMPLS=$PYTHON_COMPAT

inherit distutils-r1

DESCRIPTION="Tool and library for handling Web ARChive (WARC) files"
HOMEPAGE="https://github.com/chfoo/warcat"
SRC_URI="https://github.com/chfoo/warcat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RDEPEND="dev-python/isodate[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

python_compile_all() {
	if use doc; then
		cd doc || die
		emake html
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	newbin "${FILESDIR}/warcat.sh" "warcat"
	dodoc README.rst
	use doc && dodoc -r doc/_build/html
	use examples && dodoc -r example
}
