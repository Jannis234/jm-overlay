# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

GTEST_VER="1.8.0"

DESCRIPTION="A cross platform C99 library to get cpu features at runtime"
HOMEPAGE="https://github.com/google/cpu_features"
SRC_URI="https://github.com/google/cpu_features/archive/v${PV}.tar.gz -> ${P}.tar.gz
	test? ( https://github.com/google/googletest/archive/release-${GTEST_VER}.tar.gz -> gtest-${GTEST_VER}.tar.gz )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-util/cmake-3.0"

src_unpack() {
	default
	if use test; then
		mv "${WORKDIR}/googletest-release-${GTEST_VER}" "${S}/googletest-download" || die
		ln -s "googletest-download" "${S}/googletest-src" || die
	fi
}

src_prepare() {
	sed -i "/configure_file(CMakeLists.txt.in/d" CMakeLists.txt || die # Prevent downloading at runtime
	use test && multilib_copy_sources
	cmake-utils_src_prepare
}

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING="$(usex test)"
	)
	cmake-utils_src_configure
}

multilib_src_install() {
	dolib.a "libcpu_features.a"
	if multilib_is_native_abi; then
		dobin list_cpu_features
	fi
}

multilib_src_install_all() {
	doheader include/*.h
	dodoc README.md CONTRIBUTING.md OWNERS
}
