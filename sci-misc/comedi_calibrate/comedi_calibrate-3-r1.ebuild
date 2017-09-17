# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Linux control and measurement device interface (calibration tool)"
HOMEPAGE="http://www.comedi.org/"
SRC_URI="http://www.comedi.org/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sci-libs/comedilib
	sci-libs/gsl
	dev-libs/boost"
DEPEND="${RDEPEND}"

src_install() {
	default

	dodoc AUTHORS ChangeLog INSTALL NEWS README
}
