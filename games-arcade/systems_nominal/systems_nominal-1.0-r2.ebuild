# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="Keyboard action game"
HOMEPAGE="http://www.nerdcubed.co.uk/games/"
SRC_URI="http://assets.nerdcubed.co.uk/${PN}_${PV}_linux.7z
	http://www.nerdcubed.co.uk/favicon.ico -> ${PN}.ico"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

DEPEND="app-arch/p7zip"
RDEPEND="
	x11-libs/libX11
	x11-libs/libXrender
	dev-libs/glib:2
	x11-libs/libXtst
	x11-libs/gtk+:2
	dev-libs/atk
	x11-libs/pango
	x11-libs/gdk-pixbuf
	x11-libs/cairo
	media-libs/freetype
	media-libs/fontconfig
	x11-libs/libXi
	x11-libs/libXcomposite
	dev-libs/nss
	dev-libs/nspr
	gnome-base/gconf
	x11-libs/libXext
	x11-libs/libXfixes
	media-libs/alsa-lib
	x11-libs/libXdamage
	dev-libs/expat
	sys-apps/dbus
	sys-libs/libudev-compat
"

RESTRICT="mirror bindist splitdebug"

QA_PREBUILT="${EROOT}/opt/${PN}/systemsnominal
	${EROOT}/opt/${PN}/libffmpegsumo.so"
QA_PRESTRIPPED="${EROOT}/opt/${PN}/systemsnominal"

S="${WORKDIR}"

src_unpack() {
	default
	cp "${DISTDIR}"/${PN}.ico "${WORKDIR}" || die
}

src_prepare() {
	eapply_user
	use x86 || rm -rf ./linux32
	use amd64 || rm -rf ./linux64
}

src_install() {
	local dir="${EROOT}/opt/${PN}"

	insinto ${dir}
	use x86 && doins ./linux32/*
	use amd64 && doins ./linux64/*
	chmod +x "${D}"/${dir}/systemsnominal || die

	newicon ${PN}.ico ${PN}.ico # Game's website doens't have any icons for this game, so we'll use the website's icon

	make_wrapper ${PN} ${dir}/systemsnominal ${dir} ${dir}
	make_desktop_entry ${PN} "Systems Nominal" "/usr/share/pixmaps/${PN}.ico"
}
