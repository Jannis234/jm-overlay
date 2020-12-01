# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

MyPN="AnnexRemote"
MyP="${MyPN}-${PV}"

DESCRIPTION="Helper module to easily develop git-annex remotes"
HOMEPAGE="https://github.com/Lykos153/AnnexRemote"
SRC_URI="https://github.com/Lykos153/AnnexRemote/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

S="${WORKDIR}/${MyP}"

RDEPEND="dev-python/future[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_install_all() {
	distutils-r1_python_install_all
	dodoc README.md
	use examples && dodoc -r examples
}
