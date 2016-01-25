# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-multilib

DESCRIPTION="library + tool that creates colorful video barcodes"
HOMEPAGE="https://nordlicht.github.io/"
SRC_URI="https://github.com/blinry/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+ BSD BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/ffmpeg[${MULTILIB_USEDEP}]
	dev-libs/popt[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	sys-apps/help2man"

DOCS=( README.md CHANGELOG.md )
