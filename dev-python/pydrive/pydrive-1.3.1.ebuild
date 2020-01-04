# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{6,7,8} pypy )

inherit distutils-r1

MyPN="PyDrive"
MyP="${MyPN}-${PV}"

DESCRIPTION="Google Drive API made easy."
HOMEPAGE="https://github.com/gsuitedevs/PyDrive"
SRC_URI="https://github.com/gsuitedevs/PyDrive/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RDEPEND=">=dev-python/google-api-python-client-1.2[${PYTHON_USEDEP}]
	>=dev-python/oauth2client-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MyP}"

python_compile_all() {
	use doc && esetup.py build_sphinx --source-dir=docs --build-dir="${S}/sphinx" --all-files
}

python_install_all() {
	distutils-r1_python_install_all
	dodoc CHANGES CONTRIBUTING.rst README.rst
	use examples && dodoc -r examples
	use doc && dodoc -r "${S}/sphinx/html"
}
