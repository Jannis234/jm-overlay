# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_5 )
ZSTD_VERSION="0.7.5"

inherit distutils-r1

DESCRIPTION="Python bindings to Yann Collet ZSTD compression library"
HOMEPAGE="https://github.com/sergey-dryabzhinsky/python-zstd"
SRC_URI="https://github.com/sergey-dryabzhinsky/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Cyan4973/zstd/archive/v${ZSTD_VERSION}.tar.gz -> zstd-${ZSTD_VERSION}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.rst )

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_unpack() {
	default
	mv "${WORKDIR}"/zstd-${ZSTD_VERSION}/* "${S}"/zstd/ || die
}

python_test() {
	esetup.py test || die "Tests failed"
}
