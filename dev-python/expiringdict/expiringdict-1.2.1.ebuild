# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11,12} )
inherit distutils-r1
DISTUTILS_USE_PEP517=setuptools

DESCRIPTION="Helper module to easily develop git-annex remotes"
HOMEPAGE="https://github.com/mailgun/expiringdict"
SRC_URI="https://github.com/mailgun/expiringdict/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
