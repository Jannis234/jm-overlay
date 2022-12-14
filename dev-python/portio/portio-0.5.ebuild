# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )
inherit distutils-r1

DESCRIPTION="Python low level port I/O for Linux x86"
HOMEPAGE="http://portio.inrim.it/ https://pypi.org/project/portio/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( index.rst )
