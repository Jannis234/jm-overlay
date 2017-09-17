# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Fast Python bindings for Sophia Database"
HOMEPAGE="https://github.com/coleifer/sophy"
SRC_URI="https://github.com/coleifer/sophy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test" # Broken

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]"

python_test() {
	distutils_install_for_testing
	${EPYTHON} tests.py || die "Tests failed"
}
