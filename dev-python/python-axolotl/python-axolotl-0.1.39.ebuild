# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Python port of libaxolotl"
HOMEPAGE="https://github.com/tgalal/python-axolotl"
SRC_URI="https://github.com/tgalal/python-axolotl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/protobuf-3.0.0_beta2[${PYTHON_USEDEP}]
	dev-python/pycrypto[${PYTHON_USEDEP}]
	dev-python/python-axolotl-curve25519[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.md )
