# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

CMAKE_IN_SOURCE_BUILD="1"

DESCRIPTION="Stand alone sound visualization"
HOMEPAGE="https://github.com/maysl/fische"
SRC_URI="https://github.com/maysl/fische/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/opengl
	media-libs/freeglut
	dev-libs/boost:=[threads]"
DEPEND="${RDEPEND}"

src_install() {
	dobin fische
}
