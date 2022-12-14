# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="git-annex special remote for GoogleDrive"
HOMEPAGE="https://github.com/Lykos153/git-annex-remote-googledrive"
SRC_URI="https://github.com/Lykos153/git-annex-remote-googledrive/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/annexremote[${PYTHON_USEDEP}]
	>=dev-python/drivelib-0.1.4[${PYTHON_USEDEP}]
	dev-python/GitPython[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/humanfriendly[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
