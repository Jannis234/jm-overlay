# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

DESCRIPTION="Side-scrolling skateboarding video game"
HOMEPAGE="http://www.roll7.co.uk/#!olliolli/c1ic0"
SRC_URI="${PN}_linux_${PV}.tar.bz2
	http://www.curve-studios.com/press/OlliOlli/images/logo.png -> ${PN}.png"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="bundled-libs"

DEPEND=""
RDEPEND="!bundled-libs? (
		x86? ( 
			media-libs/openal
			dev-games/physfs[zip]
		)
		amd64? (
			media-libs/openal[abi_x86_32(-)]
			dev-games/physfs[zip,abi_x86_32(-)]
		)
	)"

RESTRICT="mirror bindist splitdebug"

QA_PREBUILT="${GAMES_PREFIX_OPT#/}/${PN}/linux32
	${GAMES_PREFIX_OPT#/}/${PN}/libopenal.so.1
	${GAMES_PREFIX_OPT#/}/${PN}/libphysfs.so.1"

S="${WORKDIR}/linux32"

pkg_nofetch() {
	einfo "Please buy and download ${PN}_linux_${PV}.tar.bz2 from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_unpack() {
	default
	cp "${DISTDIR}"/${PN}.png "${WORKDIR}" || die
}

src_prepare() {
	if ! use bundled-libs; then
		rm libopenal.so.1 libphysfs.so.1 || die
	fi
	# Bundled libraries that are not used by the game
	rm libpng12.so.0 libSDL2-2.0.so.0 libSDL2_image-2.0.so.0 || die
	rm run.sh || die
}

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}

	insinto ${dir}
	doins ./*
	chmod +x "${D}"/${dir}/linux32 || die

	newicon "${WORKDIR}"/${PN}.png ${PN}.png

	games_make_wrapper ${PN} ${dir}/linux32 ${dir} ${dir}
	make_desktop_entry ${PN} "OlliOlli" "/usr/share/pixmaps/${PN}.png"

	prepgamesdirs
}
