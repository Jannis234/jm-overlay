# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="readline"
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Python WhatsApp library and CLI client"
HOMEPAGE="https://github.com/tgalal/yowsup"
SRC_URI="https://github.com/tgalal/yowsup/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+encryption"

RDEPEND=">=dev-python/axolotl-0.1.1[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/configargparse[${PYTHON_USEDEP}]
	encryption? (
		dev-libs/protobuf[${PYTHON_USEDEP}]
		dev-python/pycrypto[${PYTHON_USEDEP}]
		dev-python/axolotl-curve25519[${PYTHON_USEDEP}]
	)"
DEPEND="${RDEPEND}"
