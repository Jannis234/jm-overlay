# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MyPN="Democracy3"

inherit eutils

DESCRIPTION="Indepth political simulator"
HOMEPAGE="http://www.positech.co.uk/democracy3/index.php"
SRC_URI="${MyPN}-${PV}-Linux.run"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="doc bundled-libs"

DEPEND="app-arch/unzip"
RDEPEND="virtual/opengl
	sys-libs/zlib
	!bundled-libs? (
		media-libs/libsdl2
		media-libs/openal
	)"

RESTRICT="fetch strip mirror bindist splitdebug"
S="${WORKDIR}/data"
QA_PREBUILT="opt/${MyPN}/*.x86
	opt/${MyPN}/*/Mono/x86/libmono.so
	opt/${MyPN}/*/Plugins/x86/ScreenSelector.so"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_unpack() {
	# This is a shell script with a gzip (setup binaries) and a zip archive (game data) inside
	# The zip archive really confuses unpacker.eclass
	tail -c +421887 "${DISTDIR}/${SRC_URI}" > "${WORKDIR}/dm3.zip" || die
	unpack "${WORKDIR}/dm3.zip" || die
}

src_install() {
	local dir="/opt/${MyPN}"

	insinto ${dir}
	doins -r noarch/data noarch/${MyPN}.png
	if use x86; then
		newins x86/${MyPN}.bin.x86 ${MyPN}.bin
		use bundled-libs && doins x86/lib/*
	fi
	if use amd64; then
		newins x86_64/${MyPN}.bin.x86_64 ${MyPN}.bin
		use bundled-libs && doins x86_64/lib64/*
	fi
	fperms +x "${dir}/${MyPN}.bin"

	dodoc noarch/changelist.txt noarch/README.linux
	use doc && dodoc noarch/D3Manual.pdf

	make_wrapper ${PN} "${dir}/${MyPN}.bin" ${dir} ${dir}
	make_desktop_entry ${PN} "Democracy 3" "${EROOT}opt/${MyPN}/${MyPN}.png"
}
