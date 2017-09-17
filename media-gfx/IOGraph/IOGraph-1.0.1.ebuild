# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils java-utils-2

MyPV="1_0_1"

DESCRIPTION="Application that turns mouse movements into modern art"
HOMEPAGE="http://iographica.com/"
SRC_URI="http://iographica.com/download/linux/${PN}_v${MyPV}.jar"

LICENSE="all-rights-reserved"
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
