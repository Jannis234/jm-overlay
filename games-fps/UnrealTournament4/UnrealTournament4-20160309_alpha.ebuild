# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games check-reqs eutils

# The official name of the game is just "UnrealTournament" without any number at the end
# The ebuild is still named UnrealTournament4 to avoid confusion with games-fps/unreal-tournament (UT99)
MyPN="UnrealTournament"
Build_Version="2899548"

DESCRIPTION="Futuristic FPS (Pre-Alpha version)"
HOMEPAGE="https://unrealtournament.com/"
SRC_URI="${MyPN}-Client-XAN-${Build_Version}-Linux.zip"
FORUM_URI="https://forums.unrealtournament.com/"

LICENSE="UT4-PreAlpha-EULA"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="virtual/opengl"

RESTRICT="fetch mirror bindist splitdebug"

S="${WORKDIR}/LinuxNoEditor"
CHECKREQS_DISK_BUILD="17G"

QA_PREBUILT="${GAMES_PREFIX_OPT#/}/${MyPN}/Engine/Binaries/*
	${GAMES_PREFIX_OPT#/}/${MyPN}/Engine/Plugins/*
	${GAMES_PREFIX_OPT#/}/${MyPN}/UnrealTournament/Binaries/*
	${GAMES_PREFIX_OPT#/}/${MyPN}/UnrealTournament/Plugins/*"

pkg_nofetch() {
	einfo "Please register a free account at:"
	einfo "   ${FORUM_URI}"
	einfo "and download the linux client"
	einfo "   ${SRC_URI}"
	einfo "from the \"Members only\" section."
	einfo "Place the file in:"
	einfo "   ${DISTDIR}"
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${MyPN}"

	dodir "${dir}"
	# Use mv instead of doins to avoid copying about 15G of data
	mv ./* "${D}/${dir}/"

	chmod +x "${D}/${dir}/Engine/Binaries/Linux/UE4-Linux-Shipping" || die
	chmod +x "${D}/${dir}/Engine/Binaries/Linux/CrashReportClient" || die
	# Tries to write into the game's directory, not the user's home directory
	rm "${D}/${dir}/Engine/Binaries/Linux/UE4-Linux-Test" || die

	insinto "${dir}"
	newins "${FILESDIR}/ut4_launcher.sh" "${MyPN}.sh"
	chmod +x "${D}/${dir}/${MyPN}.sh" || die
	games_make_wrapper "${MyPN}" "${dir}/${MyPN}.sh" "${dir}"

	newicon "${FILESDIR}/ut4_logo.png" "${MyPN}.png"
	make_desktop_entry "${MyPN}" "Unreal Tournament (Pre-Alpha)" "${MyPN}"

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	echo
	elog "Please keep in mind that the game is still in very early development"
	elog "and the pre-alpha phase does not represent the plans for future versions."
	elog "This version is still very incomplete and very likely to have bugs."
	echo
}
