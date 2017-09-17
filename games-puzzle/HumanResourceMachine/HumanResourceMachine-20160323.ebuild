# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Program little office workers to solve puzzles"
HOMEPAGE="http://tomorrowcorporation.com/humanresourcemachine"
SRC_URI="HumanResourceMachine-Linux-2016-03-23.sh"

RESTRICT="fetch mirror bindist bundled-libs? ( splitdebug )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="bundled-libs"

DEPEND="app-arch/unzip"
R0DEPEND="virtual/opengl
	sys-libs/zlib
	!bundled-libs? (
		media-libs/openal
		media-libs/libsdl2
	)"

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_unpack() {
	# Makeself installer with a zip archive inside the shell script
	# unpacker.eclass currently doesn't support this
	tail -c +421887 "${DISTDIR}/${SRC_URI}" > "tmp.zip" || die
	unzip -q "tmp.zip" || die
	rm tmp.zip || die
}

src_install() {
	dir="/opt/${PN}"
	arch=$(usex amd64 x86_64 x86)
	libdir=$(usex amd64 lib64 lib)

	cd data || die
	use bundled-libs || rm -r "${arch}/${libdir}"
	dodoc noarch/README.linux
	rm noarch/README.linux noarch/LICENSE.txt || die
	insinto "${dir}"
	doins -r noarch/* ${arch}/*
	chmod +x "${D}/${dir}/${PN}.bin.${arch}" || die

	make_wrapper "${PN}" "${dir}/${PN}.bin.${arch}" "${dir}" "${dir}/${libdir}"
	make_desktop_entry "${PN}" "Human Resource Machine" "${EPREFIX}${dir}/icon.png"
}
