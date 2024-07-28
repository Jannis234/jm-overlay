# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake-multilib

DESCRIPTION="C++ implementation of the JPEG-LS standard"
HOMEPAGE="https://github.com/team-charls/charls"
SRC_URI="https://github.com/team-charls/charls/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

multilib_src_configure() {
	myconfig() {
		local mycmakeargs=(
			-DCHARLS_BUILD_SAMPLES=OFF
			-DCHARLS_BUILD_TESTS=OFF
			-DCHARLS_INSTALL=ON
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

multilib_src_compile() {
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant cmake_src_compile
}

multilib_src_install() {
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant cmake_src_install
}

multilib_src_install_all() {
	dodoc CHANGELOG.md README.md SECURITY.md
}
