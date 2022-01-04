# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Classes to calculate CRCs and checksums from binary data"
HOMEPAGE="https://sourceforge.net/projects/crccheck/"
SRC_URI="https://sourceforge.net/projects/crccheck/files/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

distutils_enable_tests "nose"

src_prepare() {
	sed -i "s/, 'tests'//g" setup.py || die
	eapply_user
}
