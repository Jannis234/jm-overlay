# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1

DESCRIPTION="Core Python Web Archiving Toolkit for replay and recording of web archives"
HOMEPAGE="https://github.com/webrecorder/pywb"
SRC_URI="https://github.com/webrecorder/pywb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/warcio-1.5.0[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/redis-py[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	>=dev-python/surt-0.3.0[${PYTHON_USEDEP}]
	dev-python/brotlipy[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/webencodings[${PYTHON_USEDEP}]
	>=dev-python/gevent-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/webassets-0.12.1[${PYTHON_USEDEP}]
	dev-python/portalocker[${PYTHON_USEDEP}]
	>=dev-python/wsgiprox-1.4.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

src_prepare() {
	eapply_user
	rm -r tests || die # Build system wants to install tests
}

python_compile_all() {
	if use doc; then
		cd doc || die
		emake html
	fi
}

python_install_all() {
	distutils-r1_python_install_all

	dodoc README.rst CHANGES.rst
	use doc && dodoc -r doc/_build/html
}
