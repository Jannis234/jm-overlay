# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )
inherit distutils-r1

DESCRIPTION="Fake implementation of redis API (redis-py) for testing purposes"
HOMEPAGE="https://github.com/jamesls/fakeredis"
SRC_URI="https://github.com/jamesls/fakeredis/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/redis-py[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst CONTRIBUTING.rst )
