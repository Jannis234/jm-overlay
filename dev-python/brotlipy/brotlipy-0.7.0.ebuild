# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )
inherit distutils-r1

BROTLI_VER="0.6.0"

DESCRIPTION="Python bindings to the Brotli compression library"
HOMEPAGE="https://github.com/python-hyper/brotlipy/"
SRC_URI="https://github.com/python-hyper/brotlipy/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/brotli/archive/v${BROTLI_VER}.tar.gz -> brotli-${BROTLI_VER}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="virtual/python-cffi[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

src_unpack() {
	default
	rmdir "${S}/libbrotli" || die
	mv "${WORKDIR}/brotli-${BROTLI_VER}" "${S}/libbrotli" || die
}

python_compile_all() {
	if use doc; then
		cd docs || die
		emake html
	fi
}

python_install_all() {
	distutils-r1_python_install_all
	dodoc README.rst HISTORY.rst
	use doc && dodoc -r docs/build/html
}
