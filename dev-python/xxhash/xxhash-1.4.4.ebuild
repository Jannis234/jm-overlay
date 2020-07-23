# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Python binding for the xxHash library"
HOMEPAGE="https://github.com/ifduyue/python-xxhash"
SRC_URI="https://github.com/ifduyue/python-xxhash/archive/v1.4.4.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/xxhash"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/python-${P}"

src_compile() {
	export XXHASH_LINK_SO=1
	distutils-r1_src_compile
}
