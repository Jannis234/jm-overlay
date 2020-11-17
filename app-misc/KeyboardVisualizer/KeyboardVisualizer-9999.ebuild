# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 qmake-utils desktop

DESCRIPTION="Audio visualizer and effects engine using the OpenRGB SDK"
HOMEPAGE="https://gitlab.com/CalcProgrammer1/KeyboardVisualizer"
EGIT_REPO_URI="https://gitlab.com/CalcProgrammer1/KeyboardVisualizer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

BDEPEND=""
RDEPEND="media-libs/openal:=
	dev-qt/qtcore:5=
	dev-qt/qtwidgets:5=
	dev-qt/qtgui:5=
	virtual/opengl"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5
}

src_install() {
	dobin KeyboardVisualizer
	newicon "KeyboardVisualizerQT/KeyboardVisualizer.png" "KeyboardVisualizer.png"
	domenu "KeyboardVisualizerQT/KeyboardVisualizer.desktop"
	dodoc README.md
}
