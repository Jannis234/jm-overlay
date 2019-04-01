# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="A command line interface and FUSE filesystem for Amazon (Cloud) Drive"
HOMEPAGE="https://github.com/yadayada/acd_cli"
SRC_URI="https://github.com/yadayada/acd_cli/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc man info"

RDEPEND="dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/fusepy[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	>=dev-python/requests-2.1.0[${PYTHON_USEDEP}]
	!=dev-python/requests-2.9.0
	!=dev-python/requests-2.12.0
	!=dev-python/requests-toolbelt-0.5.0"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-paramlinks[${PYTHON_USEDEP}]
	)
	man? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-paramlinks[${PYTHON_USEDEP}]
	)
	info? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-paramlinks[${PYTHON_USEDEP}]
		sys-apps/texinfo
	)"

python_compile_all() {
	if use doc || use man || use info; then
		cd docs || die
		emake SHPINXBUILD="python3 $(which sphinx-build)" \
			$(use doc && echo html) $(use man && echo man) $(use info && echo info)
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc README.rst CONTRIBUTING.rst
	use doc && dodoc -r docs/_build/html
	use man && doman docs/_build/man/acd_cli.1
	use info && doinfo docs/_build/texinfo/acd_cli.info
}
