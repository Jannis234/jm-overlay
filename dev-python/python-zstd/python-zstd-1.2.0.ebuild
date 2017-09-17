# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy )
ZSTD_VERSION="${PV}"

inherit distutils-r1

DESCRIPTION="Python bindings to Yann Collet ZSTD compression library"
HOMEPAGE="https://github.com/sergey-dryabzhinsky/python-zstd"
SRC_URI="https://github.com/sergey-dryabzhinsky/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	!system-libzstd? ( https://github.com/facebook/zstd/archive/v${ZSTD_VERSION}.tar.gz -> zstd-${ZSTD_VERSION}.tar.gz )"

LICENSE="BSD-2 !system-libzstd? ( BSD )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-libzstd legacy-formats legacy-api"

DOCS=( README.rst )

RDEPEND="system-libzstd? ( >=app-arch/zstd-${ZSTD_VERSION} )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_unpack() {
	default
	if ! use system-libzstd; then
		mv "${WORKDIR}"/zstd-${ZSTD_VERSION}/* "${S}"/zstd/ || die
	fi
}

python_compile() {
	distutils-r1_python_compile \
		$(usex legacy-formats "--legacy" "") \
		$(usex legacy-api "--pyzstd-legacy" "") \
		$(usex system-libzstd "--external" "")
}

python_install() {
	distutils-r1_python_install \
		$(usex legacy-formats "--legacy" "") \
		$(usex legacy-api "--pyzstd-legacy" "") \
		$(usex system-libzstd "--external" "")
}

python_test() {
	esetup.py test \
		$((use legacy-formats || use system-libzstd) && echo --legacy) \
		$(usex legacy-api "--pyzstd-legacy" "") \
		$(usex system-libzstd "--external" "") || die "Tests failed"
}

pkg_postinst() {
	if use system-libzstd && ! use legacy-formats; then
		ewarn "Turning off the \"legacy-formats\" USE flag has no effect if \"system-libzstd\" is set!"
	fi
}
