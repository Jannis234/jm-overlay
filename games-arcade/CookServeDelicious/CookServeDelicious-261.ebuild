# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

DESCRIPTION="The most intense cooking game ever made"
HOMEPAGE="http://www.vertigogaming.net/CSD/"
SRC_URI="CSDLinux_261.zip"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="x86? (
			sys-libs/zlib
			x11-libs/libXxf86vm
			virtual/opengl
			media-libs/openal
			dev-libs/openssl:0
			x11-libs/libX11
		)
		amd64? (
			sys-libs/zlib[abi_x86_32(-)]
			x11-libs/libXxf86vm[abi_x86_32(-)]
			virtual/opengl[abi_x86_32(-)]
			media-libs/openal[abi_x86_32(-)]
			dev-libs/openssl:0[abi_x86_32(-)]
			x11-libs/libX11[abi_x86_32(-)]
		)"

RESTRICT="fetch strip mirror bindist"
S="${WORKDIR}/CSDSteamBuild"
QA_PREBUILT="${GAMES_PREFIX_OPT#/}/${PN}/runner"

pkg_nofetch() {
	einfo "Please buy and download CSDLinux_${PV}.zip from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}"

	insinto ${dir}
	doins -r *
	chmod +x "${D}/${dir}/runner" || die

	games_make_wrapper ${PN} ${dir}/runner ${dir} ${dir}
	make_desktop_entry ${PN} "Cook, Serve, Delicious!" "${dir}/assets/icon.png"

	prepgamesdirs
}
