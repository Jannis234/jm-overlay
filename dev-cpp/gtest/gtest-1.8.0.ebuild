# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

DESCRIPTION="Google C++ Testing Framework"
HOMEPAGE="https://github.com/google/googletest"
SRC_URI="https://github.com/google/googletest/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/googletest-release-${PV}/googletest"

src_prepare() {
	eapply "${FILESDIR}/gtest-1.8.0-libdir.patch"
	eapply_user
}

multilib_src_configure() {
	local mycmakeargs=(
		-DLIBDIR="$(get_libdir)"
		-DBUILD_SHARED_LIBS=ON
		-Dgtest_build_samples=$(multilib_is_native_abi && use examples && echo ON || echo OFF)
		-Dgtest_build_tests=$(usex test)
	)
	cmake-utils_src_configure
}

multilib_src_install() {
	cmake-utils_src_install
	docinto samples
	multilib_is_native_abi && use examples && dodoc sample*_unittest
}

multilib_src_install_all() {
	dodoc CHANGES CONTRIBUTORS README.md
	use examples && dodoc -r samples
	use doc && dodoc docs/*.md
}
