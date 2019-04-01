# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="Python port of libaxolotl"
HOMEPAGE="https://github.com/tgalal/python-axolotl"
EGIT_REPO_URI="https://github.com/tgalal/python-axolotl.git"
EGIT_COMMIT="9585d7212c95c47aa97e0a4d74b4a756e4d11daa"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/protobuf-python-2.6[${PYTHON_USEDEP}]
	dev-python/pycrypto[${PYTHON_USEDEP}]
	dev-python/python-axolotl-curve25519[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.md )
