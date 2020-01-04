# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{6,7,8} pypy pypy3 )
inherit distutils-r1

DESCRIPTION="Transport adapter for fetching file:// URLs with the requests python library"
HOMEPAGE="https://github.com/dashea/requests-file"
SRC_URI="https://github.com/dashea/requests-file/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

DOCS=( README.rst CHANGES.rst )
