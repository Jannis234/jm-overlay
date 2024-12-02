# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11,12,13} pypy3 )

inherit distutils-r1
DISTUTILS_USE_PEP517=setuptools

DESCRIPTION="Classes to calculate CRCs and checksums from binary data"
HOMEPAGE="https://github.com/MartinScharrer/crccheck"
SRC_URI="https://github.com/MartinScharrer/crccheck/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
