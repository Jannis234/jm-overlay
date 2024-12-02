# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11,12,13} pypy3 )

inherit distutils-r1
DISTUTILS_USE_PEP517=setuptools

DESCRIPTION="Tool and library for handling Web ARChive (WARC) files"
HOMEPAGE="https://github.com/chfoo/warcat"
SRC_URI="https://github.com/chfoo/warcat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="dev-python/isodate[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

distutils_enable_sphinx doc

python_install_all() {
	distutils-r1_python_install_all

	newbin "${FILESDIR}/warcat.sh" "warcat"
	dodoc README.rst
	use examples && dodoc -r example
}
