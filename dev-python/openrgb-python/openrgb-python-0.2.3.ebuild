# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11,12,13} )

inherit distutils-r1
DISTUTILS_USE_PEP517=setuptools

DESCRIPTION="A python client for the OpenRGB SDK"
HOMEPAGE="https://github.com/jath03/openrgb-python/"
SRC_URI="https://github.com/jath03/openrgb-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_sphinx docs

src_install() {
	distutils-r1_src_install
	use examples && dodoc -r examples
}
