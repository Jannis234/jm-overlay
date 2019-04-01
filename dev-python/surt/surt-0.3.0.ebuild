# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6} )
inherit distutils-r1

DESCRIPTION="Sort-friendly URI Reordering Transform (SURT) python module"
HOMEPAGE="https://github.com/internetarchive/surt"
SRC_URI="https://github.com/internetarchive/surt/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/tldextract-2.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst )
