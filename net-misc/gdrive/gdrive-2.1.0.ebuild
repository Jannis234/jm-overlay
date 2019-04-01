# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build

EGO_PN="github.com/prasmussen/gdrive"

DESCRIPTION="Command line utility for interacting with Google Drive"
HOMEPAGE="https://github.com/prasmussen/gdrive"
SRC_URI="https://github.com/prasmussen/gdrive/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/go-1.5"
RDEPEND=""

src_unpack() {
	default
	mv "${S}" "${WORKDIR}/tmp"
	mkdir -p "${S}/src/${EGO_PN}" || die
	mv "${WORKDIR}/tmp/"* "${S}/src/${EGO_PN}/" || die
}

src_install() {
	dobin gdrive
	dodoc "src/${EGO_PN}/README.md"
}
