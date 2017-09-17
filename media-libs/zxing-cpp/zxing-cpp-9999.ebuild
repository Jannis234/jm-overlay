# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-multilib

DESCRIPTION="Multi-format 1D/2D barcode image processing library (C++ port)"
HOMEPAGE="https://github.com/zxing/zxing"
EGIT_REPO_URI="https://github.com/glassechidna/zxing-cpp.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND=">=dev-util/cmake-2.8.0
	test? ( dev-util/cppunit[${MULTILIB_USEDEP}] )"

src_prepare() {
	sed -i "s/DESTINATION lib/DESTINATION \$\{CMAKE_INSTALL_LIBDIR\}/" CMakeLists.txt || die
	eapply_user
}

multilib_src_test() {
	./testrunner || die
}
