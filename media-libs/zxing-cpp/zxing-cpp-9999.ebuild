# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-multilib eutils

DESCRIPTION="Multi-format 1D/2D barcode image processing library (C++ port)"
HOMEPAGE="https://github.com/zxing/zxing"
EGIT_REPO_URI="https://github.com/glassechidna/zxing-cpp.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=">=dev-util/cmake-2.8.0"

src_prepare() {
	sed -i "s/DESTINATION lib/DESTINATION \$\{CMAKE_INSTALL_LIBDIR\}/" CMakeLists.txt || die

	epatch_user
}
