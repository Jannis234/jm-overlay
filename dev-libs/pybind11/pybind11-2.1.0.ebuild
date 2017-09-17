# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Lightweight library that exposes C++ types in Python and vice versa"
HOMEPAGE="https://github.com/wjakob/pybind11"
SRC_URI="https://github.com/pybind/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc man info"

RDEPEND="info? ( sys-apps/texinfo )"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/breathe[${PYTHON_USEDEP}]
	)
	man? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/breathe[${PYTHON_USEDEP}]
	)
	info? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/breathe[${PYTHON_USEDEP}]
	)"

python_compile_all() {
	if use doc || use man || use info; then
		cd docs || die
		emake $(use doc && echo html) $(use man && echo man) $(use info && echo info)
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc README.md
	use doc && dodoc -r docs/.build/html
	use man && doman docs/.build/man/pybind11.1
	use info && doinfo docs/.build/texinfo/pybind11.info
}
