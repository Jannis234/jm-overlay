# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Tray application and Dolphin/Plasma integration for Syncthing"
HOMEPAGE="https://github.com/Martchus/syncthingtray"
SRC_URI="https://github.com/Martchus/syncthingtray/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde systemd webkit webengine"

DEPEND=">=dev-cpp/cpp-utilities-5.19.0:=
	>=dev-libs/qtutilities-6.8.0:=
	>=dev-libs/qtforkawesome-0.0.3:=
	>=dev-qt/qtcore-5.6:5=
	>=dev-qt/qtnetwork-5.6:5=
	>=dev-qt/qtgui-5.6:=
	>=dev-qt/qtwidgets-5.6:=
	>=dev-qt/qtsvg-5.6:=
	webkit? (
		>=dev-qt/qtdeclarative-5.6:=
		dev-qt/qtwebkit:5=
	)
	webengine? (
		>=dev-qt/qtdeclarative-5.6:=
		>=dev-qt/qtwebengine-5.6:5=
	)
	systemd? ( >=dev-qt/qtdbus-5.6:5= )
	kde? (
		>=dev-qt/qtdeclarative-5.12:=
		kde-frameworks/kio:5=
		kde-frameworks/plasma:5=
	)"
RDEPEND="${DEPEND}
	net-p2p/syncthing"
BDEPEND=""

RESTRICT="test" # Needs running syncthing instance

REQUIRED_USE="^^ ( webkit webengine )"

src_configure() {
	webview="none"
	js="none"
	use webkit && webview="webkit" && js="qml"
	use webengine && webview="webengine" && js="qml"
	local mycmakeargs=(
		-DAPPEND_GIT_REVISION=OFF
		-DBUILD_SHARED_LIBS=ON
		-DSTATIC_LINKAGE=OFF
		-DNO_FILE_ITEM_ACTION_PLUGIN=$(usex kde OFF ON)
		-DNO_PLASMOID=$(usex kde OFF ON)
		-DSYSTEMD_SUPPORT=$(usex systemd)
		-DWEBVIEW_PROVIDER=$webview
		-DJS_PROVIDER=$js
	)
	cmake_src_configure
}
