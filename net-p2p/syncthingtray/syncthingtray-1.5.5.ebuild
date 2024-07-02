# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Tray application and Dolphin/Plasma integration for Syncthing"
HOMEPAGE="https://github.com/Martchus/syncthingtray"
SRC_URI="https://github.com/Martchus/syncthingtray/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5 qt6 kde systemd webengine"

DEPEND=">=dev-cpp/cpp-utilities-5.20.0:=
	>=dev-libs/qtutilities-6.13.0:=[qt5=,qt6=]
	>=dev-libs/qtforkawesome-0.0.3:=[qt5=,qt6=,declarative]
	qt5? (
		>=dev-qt/qtcore-5.8:5=
		>=dev-qt/qtnetwork-5.8:5=
		>=dev-qt/qtgui-5.8:=
		>=dev-qt/qtwidgets-5.8:=
		>=dev-qt/qtsvg-5.8:=
		webengine? (
			>=dev-qt/qtdeclarative-5.8:=
			>=dev-qt/qtwebengine-5.8:5=
		)
		systemd? ( >=dev-qt/qtdbus-5.8:5= )
		kde? (
			>=dev-qt/qtdeclarative-5.12:=
			kde-frameworks/kio:5=
			kde-plasma/libplasma:5=
		)
	)
	qt6? (
		dev-qt/qtbase:6=[gui,network,widgets]
		dev-qt/qtsvg:6=
		webengine? (
			dev-qt/qtwebengine:6=
			dev-qt/qtdeclarative:6=
		)
		systemd? ( dev-qt/qtbase:6=[dbus] )
		kde? (
			dev-qt/qtdeclarative:6=
			kde-frameworks/kio:6=
			kde-plasma/libplasma:6=
		)
	)"
RDEPEND="${DEPEND}
	net-p2p/syncthing"
BDEPEND=""

RESTRICT="test" # Needs running syncthing instance

src_configure() {
	local mycmakeargs=(
		-DAPPEND_GIT_REVISION=OFF
		-DBUILD_SHARED_LIBS=ON
		-DSTATIC_LINKAGE=OFF
		-DNO_FILE_ITEM_ACTION_PLUGIN=$(usex kde OFF ON)
		-DNO_PLASMOID=$(usex kde OFF ON)
		-DSYSTEMD_SUPPORT=$(usex systemd)
		-DWEBVIEW_PROVIDER=$(usex webengine webengine none)
		-DJS_PROVIDER=$(usex webengine qml none)
		-DQT_PACKAGE_PREFIX=$(usex qt5 Qt5 Qt6)
		-DKF_PACKAGE_PREFIX=$(usex qt5 KF5 KF6)
	)
	cmake_src_configure
}
