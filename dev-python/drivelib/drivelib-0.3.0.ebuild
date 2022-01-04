# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
inherit distutils-r1

DESCRIPTION="Drivelib makes GoogleDrive easily accessible from Python"
HOMEPAGE="https://github.com/Lykos153/python-drivelib"
SRC_URI="https://github.com/Lykos153/python-drivelib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/python-${P}"

RDEPEND="dev-python/google-api-python-client[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev-python/google-auth-httplib2[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
	dev-python/oauth2client[${PYTHON_USEDEP}]
	dev-python/expiringdict[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
