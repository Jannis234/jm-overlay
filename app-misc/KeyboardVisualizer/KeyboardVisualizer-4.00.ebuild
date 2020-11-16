# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils desktop

OPENRGB_VERSION="0.4"

DESCRIPTION="Audio visualizer and effects engine using the OpenRGB SDK"
HOMEPAGE="https://gitlab.com/CalcProgrammer1/KeyboardVisualizer"
SRC_URI="https://gitlab.com/CalcProgrammer1/KeyboardVisualizer/-/archive/release_${PV}/KeyboardVisualizer-release_${PV}.tar.bz2
	https://gitlab.com/CalcProgrammer1/OpenRGB/-/archive/release_${OPENRGB_VERSION}/OpenRGB-release_${OPENRGB_VERSION}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND=""
RDEPEND="media-libs/openal:=
	dev-qt/qtcore:5=
	dev-qt/qtwidgets:5=
	dev-qt/qtgui:5=
	virtual/opengl"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-release_${PV}"

src_unpack() {
	default
	rmdir "${S}/OpenRGB" || die
	mv "${WORKDIR}/OpenRGB-release_${OPENRGB_VERSION}" "${S}/OpenRGB"
}

src_configure() {
	eqmake5
}

src_install() {
	dobin KeyboardVisualizer
	newicon "KeyboardVisualizerQT/Icon.png" "KeyboardVisualizer.png"
	make_desktop_entry "KeyboardVisualizer" "KeyboardVisualizer" "KeyboardVisualizer"
	dodoc README.md
}
