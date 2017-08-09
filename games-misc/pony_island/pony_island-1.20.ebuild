# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Pony Island is a suspense puzzle game in disguise"
HOMEPAGE="http://www.pony-island.com/"
SRC_URI="ponyisland_linux_v${PV}.zip"

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
S="${WORKDIR}/Linux"
QA_PREBUILT="opt/PonyIsland/PonyIsland.x86
	opt/PonyIsland/PonyIsland_Data/Mono/x86/libmono.so
	opt/PonyIsland/PonyIsland_Data/Plugins/x86/*.so"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_install() {
	local dir="/opt/PonyIsland"

	insinto ${dir}
	doins -r *

	fperms +x "${dir}/PonyIsland.x86"
	make_wrapper ${PN} "${dir}/PonyIsland.x86" ${dir} ${dir}
	make_desktop_entry ${PN} "Pony Island" "${EROOT}opt/PonyIsland/PonyIsland_Data/Resources/UnityPlayer.png"
}
