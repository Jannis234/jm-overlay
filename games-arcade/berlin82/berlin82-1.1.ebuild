# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="Infinite police chase arcade game"
HOMEPAGE="https://spalt_er.itch.io/berlin82"
SRC_URI="berlin82-linux.zip"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="virtual/opengl
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXcursor
	x11-libs/gtk+:2
	dev-libs/glib:2
	x11-libs/gdk-pixbuf"

RESTRICT="fetch mirror bindist splitdebug"

QA_PREBUILT="${EROOT}/opt/${PN}/berlin82.x86
	${EROOT}/opt/${PN}/berlin82.x86_64
	${EROOT}/opt/${PN}/berlin82_Data/Plugins/x86/ScreenSelector.so
	${EROOT}/opt/${PN}/berlin82_Data/Plugins/x86_64/ScreenSelector.so
	${EROOT}/opt/${PN}/berlin82_Data/Mono/x86/libmono.so
	${EROOT}/opt/${PN}/berlin82_Data/Mono/x86_64/libmono.so"

S="${WORKDIR}/${PN}-linux"

pkg_nofetch() {
	einfo "Please download ${SRC_URI} from"
	einfo "${HOMEPAGE}"
	einfo "And place it in ${DISTDIR}"
}

src_prepare() {
	use x86 || rm -r ./berlin82.x86 ./berlin82_Data/Plugins/x86 ./berlin82_Data/Mono/x86
	use amd64 || rm -r ./berlin82.x86_64 ./berlin82_Data/Plugins/x86_64 ./berlin82_Data/Mono/x86_64
	eapply_user
}

src_install() {
	local dir=${EROOT}/opt/${PN}
	local exec=$(usex amd64 berlin82.x86_64 berlin82.x86)

	insinto ${dir}
	doins -r ./*
	chmod +x "${D}"/${dir}/${exec} || die

	make_wrapper ${PN} ${dir}/${exec} ${dir} ${dir}
	make_desktop_entry ${PN} "Berlin'82" "${GAMES_PREFIX_OPT}/${PN}/berlin82_Data/Resources/UnityPlayer.png"
}
