# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Nintendo 3DS Emulator"
HOMEPAGE="https://citra-emu.org/"
EGIT_REPO_URI="https://github.com/citra-emu/citra.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc sdl2 qt5 system-boost"

REQUIRED_USE="|| ( sdl2 qt5 )"
RDEPEND="virtual/opengl
	media-libs/libpng:=
	sys-libs/zlib
	system-boost? ( >=dev-libs/boost-1.57.0:= )
	sdl2? ( media-libs/libsdl2 )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtopengl:5
		dev-qt/qtwidgets:5
	)"
DEPEND="${DEPEND}
	>=dev-util/cmake-2.8.11
	doc? ( >=app-doc/doxygen-1.8.8[dot] )"

src_prepare() {
	eapply "${FILESDIR}/citra-system-boost.patch"
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_QT="$(usex qt5)"
		-DENABLE_SDL2="$(usex sdl2)"
		-DUSE_SYSTEM_BOOST="$(usex system-boost)"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
	if use doc; then
		doxygen || die
	fi
}

src_install() {
	cmake-utils_src_install
	dodoc README.md CONTRIBUTING.md
	use doc && dodoc -r doc-build/html
}
