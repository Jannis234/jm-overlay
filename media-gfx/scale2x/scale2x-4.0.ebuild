# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Real-time graphics effect able to increase the size of small bitmaps"
HOMEPAGE="http://www.scale2x.it/"
SRC_URI="https://github.com/amadvance/scale2x/releases/download/v${PV}/scale2x-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="media-libs/libpng:0"
RDEPEND="${DEPEND}"

src_configure() {
	default

	# Remove unneeded dependency during src_test
	sed -i "s/| fromdos//g" Makefile || die
}

src_install() {
	default
	dodoc AUTHORS HISTORY README
	use examples && dodoc -r example
}
