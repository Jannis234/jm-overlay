# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

MyPN="BigPharma"

DESCRIPTION="Big Pharma is part business sim, part logistics puzzle"
HOMEPAGE="http://bigpharmagame.com/"
SRC_URI="big_pharma_linux_${PV}.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="x86? (
		virtual/opengl
		x11-libs/libX11
		x11-libs/libXcursor
		x11-libs/gtk+:2
		dev-libs/glib:2
		x11-libs/gdk-pixbuf:2
	)
	amd64? (
		virtual/opengl[abi_x86_32(-)]
		x11-libs/libX11[abi_x86_32(-)]
		x11-libs/libXcursor[abi_x86_32(-)]
		x11-libs/gtk+:2[abi_x86_32(-)]
		dev-libs/glib:2[abi_x86_32(-)]
		x11-libs/gdk-pixbuf:2[abi_x86_32(-)]
	)"

RESTRICT="fetch strip mirror bindist splitdebug"
S="${WORKDIR}/${MyPN}"
QA_PREBUILT="opt/${MyPN}/*.x86
	opt/${MyPN}/*/Mono/x86/libmono.so
	opt/${MyPN}/*/Plugins/x86/ScreenSelector.so"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_unpack() {
	default
	mv "${WORKDIR}/big_pharma_linux_${PV}" "${WORKDIR}/big_pharma_linux_${PV}.tar"
	unpack "${WORKDIR}/big_pharma_linux_${PV}.tar" || die
	rm "${WORKDIR}/big_pharma_linux_${PV}.tar" || die
	mv "Big Pharma" "${MyPN}"
}

src_install() {
	local dir="/opt/${MyPN}"

	insinto ${dir}
	doins -r *

	chmod +x "${D}/${dir}/Big Pharma.x86" || die
	make_wrapper ${PN} "${dir}/Big\\ Pharma.x86" ${dir} ${dir}
	make_desktop_entry ${PN} "Big Pharma" "${EROOT}opt/${MyPN}/Big Pharma_Data/Resources/UnityPlayer.png"
}
