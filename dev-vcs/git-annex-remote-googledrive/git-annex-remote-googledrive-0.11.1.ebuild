# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="git-annex special remote for GoogleDrive"
HOMEPAGE="https://github.com/Lykos153/git-annex-remote-googledrive"
SRC_URI="https://github.com/Lykos153/git-annex-remote-googledrive/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/annexremote[${PYTHON_USEDEP}]
	dev-python/pydrive[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
