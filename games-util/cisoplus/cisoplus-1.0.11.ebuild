# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MyPV="${PV//./_}"
MyP="${PN}_${MyPV}"

DESCRIPTION="A powerfull PSP ISO compressor"
HOMEPAGE="http://cisoplus.pspgen.com/"
SRC_URI="http://cisoplus.pspgen.com/Files/${MyP}.zip
	doc? ( http://cisoplus.pspgen.com/cisoplus3.pdf )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="doc"

DEPEND="app-arch/unzip"
RDEPEND="sys-libs/glibc
	amd64? ( sys-libs/glibc[multilib] )"

S="${WORKDIR}"
RESTRICT="bindist mirror"

src_install() {
	dobin linux/${PN} linux/${PN}_O3
	dodoc about.txt help.txt
	use doc && dodoc "${DISTDIR}/cisoplus3.pdf"
}
