# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit games

MyPV="${PV:4:4}${PV:0:4}"

DESCRIPTION="Game about seating arrangements, wrapped around an epic tale of love and danger"
HOMEPAGE="http://popcannibal.com/girlslikerobots/"
SRC_URI="${PN}-${MyPV}.tgz
	http://popcannibal.com/girlslikerobots/Press%20Kit/Logos/Girls%20Like%20Robots.png -> ${PN}.png"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	x86? (
		virtual/opengl
		x11-libs/libX11
		x11-libs/libXext
		x11-libs/libXcursor
	)
	amd64? (
		virtual/opengl[abi_x86_32(-)]
		x11-libs/libX11[abi_x86_32(-)]
		x11-libs/libXext[abi_x86_32(-)]
		x11-libs/libXcursor[abi_x86_32(-)]
	)
"

RESTRICT="strip mirror bindist splitdebug"
S="${WORKDIR}/${PN}"
QA_PREBUILT="${GAMES_PREFIX_OPT#/}/${PN}/GirlsLikeRobots
	${GAMES_PREFIX_OPT#/}/${PN}/GirlsLikeRobots_Data/Mono/*/libmono.so"

pkg_nofetch() {
	einfo "Please buy and download ${PN}-${MyPV}.tgz from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_unpack() {
	default
	cp "${DISTDIR}"/${PN}.png "${WORKDIR}" || die
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}"

	insinto ${dir}
	doins -r *

	newicon "${WORKDIR}/${PN}.png" ${PN}.png

	chmod +x "${D}/${dir}/GirlsLikeRobots" || die
	games_make_wrapper ${PN} ${dir}/GirlsLikeRobots ${dir} ${dir}
	make_desktop_entry ${PN} "Girls Like Robots" "/usr/share/pixmaps/${PN}.png"

	prepgamesdirs
}
