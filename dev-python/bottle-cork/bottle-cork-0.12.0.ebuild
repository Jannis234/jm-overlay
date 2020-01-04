# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{6,7,8} pypy pypy3 )
inherit distutils-r1

DESCRIPTION="Authentication module for the Bottle and Flask web frameworks"
HOMEPAGE="http://cork.firelet.net/"
SRC_URI="https://github.com/FedericoCeratto/bottle-cork/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="dev-python/bottle[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_install_all() {
	distutils-r1_python_install_all

	dodoc AUTHORS CHANGELOG CONTRIBUTORS.txt README.rst
	use examples && dodoc -r examples
}
