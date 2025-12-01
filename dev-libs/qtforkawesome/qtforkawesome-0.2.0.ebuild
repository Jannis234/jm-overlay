# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake multibuild

FORKAWESOME_PV="1.2.0"

DESCRIPTION="Library that bundles ForkAwesome for use within Qt applications"
HOMEPAGE="https://github.com/Martchus/qtforkawesome"
SRC_URI="https://github.com/Martchus/qtforkawesome/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ForkAwesome/Fork-Awesome/archive/refs/tags/${FORKAWESOME_PV}.tar.gz -> ForkAwesome-${FORKAWESOME_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5 qt6 static-libs declarative"

RDEPEND="qt5? (
		dev-qt/qtcore:5=
		dev-qt/qtgui:5=
		declarative? ( dev-qt/qtdeclarative:5= )
	)
	qt6? (
		dev-qt/qtbase:6=[gui]
		declarative? ( dev-qt/qtdeclarative:6= )
	)
	>=dev-cpp/cpp-utilities-5.5.0:=
	>=dev-libs/qtutilities-6.3.0:=[qt5=,qt6=]"
DEPEND="${RDEPEND}
	dev-lang/perl
	|| ( dev-perl/YAML-LibYAML dev-perl/YAML )"
BDEPEND=""

REQUIRED_USE="^^ ( qt5 qt6 )"

src_configure() {
	myconfig() {
		local mycmakeargs=(
			-DENABLE_QT_QUICK_LIBRARY=$(usex declarative ON OFF)
			-DFORK_AWESOME_FONT_FILE="${WORKDIR}/Fork-Awesome-${FORKAWESOME_PV}/fonts/forkawesome-webfont.woff2"
			-DFORK_AWESOME_ICON_DEFINITIONS="${WORKDIR}/Fork-Awesome-${FORKAWESOME_PV}/src/icons/icons.yml"
			-DQT_PACKAGE_PREFIX=$(usex qt5 Qt5 Qt6)
		)
		if [[ ${MULTIBUILD_VARIANT} = static-libs ]]; then
			mycmakeargs+=( -DBUILD_SHARED_LIBS=OFF )
		else
			mycmakeargs+=( -DBUILD_SHARED_LIBS=ON )
		fi
		cmake_src_configure
	}
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant myconfig
}

src_compile() {
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant cmake_src_compile
}

src_install() {
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant cmake_src_install
}
