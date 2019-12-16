# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-multilib multibuild

DESCRIPTION="Common C++ classes and routines"
HOMEPAGE="https://github.com/Martchus/cpp-utilities"
SRC_URI="https://github.com/Martchus/cpp-utilities/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs test doc"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( dev-util/cppunit[${MULTILIB_USEDEP}] )"
BDEPEND="doc? ( app-doc/doxygen )"

multilib_src_configure() {
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

multilib_src_compile() {
	mycompile() {
		cmake-utils_src_compile
		if [[ ${MULTIBUILD_VARIANT} = shared ]]; then
			use doc && multilib_is_native_abi && cmake-utils_src_compile apidoc
		fi
	}
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant mycompile
}

multilib_src_install() {
	myinstall() {
		cmake-utils_src_install
		if [[ ${MULTIBUILD_VARIANT} = shared ]]; then
			use doc && multilib_is_native_abi && dodoc -r "${BUILD_DIR}/api-doc/html"
		fi
	}
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant myinstall
}

src_install() {
	cmake-multilib_src_install
	rm -rf "${ED}/usr/share/c++utilities/api-doc"
}

multilib_src_test() {
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant cmake-utils_src_compile check
}
