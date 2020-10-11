# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils multibuild

DESCRIPTION="Common Qt related C++ classes and routines"
HOMEPAGE="https://github.com/Martchus/qtutilities"
SRC_URI="https://github.com/Martchus/qtutilities/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs doc"

RDEPEND="dev-qt/qtcore:5=
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5=
	>=dev-cpp/cpp-utilities-5.5.0:="
DEPEND="${RDEPEND}"
BDEPEND="doc? ( app-doc/doxygen )"

src_configure() {
	myconfig() {
		local mycmakeargs=(
			-DAPPEND_GIT_REVISION=OFF
			-DNO_DOXYGEN=OFF
		)
		if [[ ${MULTIBUILD_VARIANT} = static-libs ]]; then
			mycmakeargs+=( -DBUILD_SHARED_LIBS=OFF )
		else
			mycmakeargs+=( -DBUILD_SHARED_LIBS=ON )
		fi
		cmake-utils_src_configure
	}
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant myconfig
}

src_compile() {
	mycompile() {
		cmake-utils_src_compile
		if [[ ${MULTIBUILD_VARIANT} = shared ]]; then
			use doc && cmake-utils_src_compile apidoc
		fi
	}
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant mycompile
}

src_install() {
	myinstall() {
		cmake-utils_src_install
		if [[ ${MULTIBUILD_VARIANT} = shared ]]; then
			use doc && dodoc -r "${BUILD_DIR}/api-doc/html"
		fi
	}
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant myinstall
	rm -rf "${ED}/usr/share/qtutilities/api-doc"
}
