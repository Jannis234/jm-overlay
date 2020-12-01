# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8,9} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Classes to calculate CRCs and checksums from binary data"
HOMEPAGE="https://bitbucket.org/martin_scharrer/crccheck"
SRC_URI="https://bitbucket.org/martin_scharrer/${PN}/downloads/${P}.zip"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

src_prepare() {
	sed -i "s/, 'tests'//g" setup.py || die
	eapply_user
}
