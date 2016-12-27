# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Clear the room of all the objects by rotating it"
HOMEPAGE="https://dustyroom.itch.io/empty"
SRC_URI="${PN}-linux.zip"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="x86? (
		virtual/opengl
		x11-libs/libX11
		x11-libs/libXcursor
		x11-libs/libXrandr
		x11-libs/gtk+:2
		dev-libs/glib:2
		x11-libs/gdk-pixbuf:2
	)
	amd64? (
		virtual/opengl[abi_x86_32(-)]
		x11-libs/libX11[abi_x86_32(-)]
		x11-libs/libXcursor[abi_x86_32(-)]
		x11-libs/libXrandr[abi_x86_32(-)]
		x11-libs/gtk+:2[abi_x86_32(-)]
		dev-libs/glib:2[abi_x86_32(-)]
		x11-libs/gdk-pixbuf:2[abi_x86_32(-)]
	)"

RESTRICT="fetch strip mirror bindist splitdebug"
S="${WORKDIR}/${PN}-linux"
QA_PREBUILT="opt/${PN}/Empty.x86
	opt/${PN}/Empty_Data/Mono/x86/libmono.so
	opt/${PN}/Empty_Data/Mono/x86/libMonoPosixHelper.so
	opt/${PN}/Empty_Data/Plugins/x86/ScreenSelector.so"

pkg_nofetch() {
	einfo "Please download ${SRC_URI} from"
	einfo "${HOMEPAGE}"
	einfo "And place it in ${DISTDIR}"
}

src_install() {
	local dir="/opt/${PN}"

	insinto ${dir}
	doins -r *

	chmod +x "${D}/${dir}/Empty.x86" || die
	make_wrapper ${PN} "${dir}/Empty.x86" ${dir} ${dir}
	make_desktop_entry ${PN} "Empty" "${EROOT}opt/${PN}/Empty_Data/Resources/UnityPlayer.png"
}
