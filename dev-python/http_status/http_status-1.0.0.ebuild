# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )
inherit distutils-r1

DESCRIPTION="A simple HTTP status code/name/description library for Python"
HOMEPAGE="https://github.com/DanielOaks/http_status"
SRC_URI="https://github.com/DanielOaks/http_status/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

DOCS=( README.rst )
