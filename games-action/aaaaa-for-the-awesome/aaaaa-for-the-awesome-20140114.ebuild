# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

DESCRIPTION="A Reckless Disregard for Gravity"
HOMEPAGE="http://www.dejobaan.com/awesome/"
SRC_URI="x86? ( Aaaaa_Awesome_x86_Linux_1389647240.zip )
	amd64? ( Aaaaa_Awesome_x64_Linux_1389653562.zip )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="virtual/opengl
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXcursor
	x11-libs/gtk+:2
	dev-libs/atk
	dev-libs/glib:2
	x11-libs/cairo
	x11-libs/pango
	x11-libs/gdk-pixbuf:2
	media-libs/freetype
	media-libs/fontconfig
"

RESTRICT="fetch mirror bindist splitdebug"
S="${WORKDIR}"
QA_PREBUILT="${EROOT}/opt/Awesome/Awesome.*
	${EROOT}/opt/Awesome/Awesome_Data/Mono/*/libmono.so
	${EROOT}/opt/Awesome/Awesome_Data/Plugins/*/*.so"

pkg_nofetch() {
	einfo "Please buy and download ${SRC_URI} from"
	einfo "https://www.humblebundle.com/store"
	einfo "And place it in ${DISTDIR}"
}

src_install() {
	local dir="${EROOT}/opt/Awesome"

	insinto ${dir}
	doins -r *

	use x86 && filename="Awesome.x86"
	use amd64 && filename="Awesome.x86_64"
	chmod +x "${D}/${dir}/${filename}" || die
	make_wrapper awesome "${dir}/${filename}" "${dir}" "${dir}"
	make_desktop_entry awesome "Aaaaa for the Awesome" "${dir}/Awesome_Data/Resources/UnityPlayer.png"
}
