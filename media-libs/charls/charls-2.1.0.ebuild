# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-multilib

DESCRIPTION="C++ implementation of the JPEG-LS standard"
HOMEPAGE="https://github.com/team-charls/charls"
SRC_URI="https://github.com/team-charls/charls/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

multilib_src_configure() {
	local mycmakeargs=(
		-DCHARLS_BUILD_SAMPLES=OFF
		-DCHARLS_BUILD_TESTS=OFF
		-DCHARLS_INSTALL=ON
	)
	cmake-utils_src_configure
}

multilib_src_install_all() {
	dodoc CHANGELOG.md README.md SECURITY.md
}
