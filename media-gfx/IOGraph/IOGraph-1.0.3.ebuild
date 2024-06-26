# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop java-utils-2

MyPV="1_0_3"

DESCRIPTION="Application that turns mouse movements into modern art"
HOMEPAGE="http://iographica.com/"
SRC_URI="https://github.com/anatolyzenkov/IOGraph/releases/download/v${PV}/${PN}_v${MyPV}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.5"

S="${WORKDIR}"

src_prepare() {
	eapply_user
}

src_install() {
	java-pkg_newjar "${DISTDIR}/${PN}_v${MyPV}.jar" "${PN}.jar"
	java-pkg_dolauncher iograph

	for size in 16 32 64 128 256 512; do
		newicon -s ${size} "recources/icon${size}.png" "iograph.png"
	done
	make_desktop_entry "iograph" "${PN}" "iograph"
}
