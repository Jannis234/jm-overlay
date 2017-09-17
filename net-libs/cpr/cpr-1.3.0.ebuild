# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib git-r3

DESCRIPTION="Simple wrapper around libcurl inspired by the Python Requests project"
HOMEPAGE="https://github.com/whoshuu/cpr"
SRC_URI="https://github.com/whoshuu/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}
	test? ( >=dev-cpp/gtest-1.8.0 )"

# Used for testing
EGIT_REPO_URI="https://github.com/whoshuu/mongoose.git"
EGIT_COMMIT="df9f7a795e65657017ab302d6367a49fdd4da183"
EGIT_CHECKOUT_DIR="${S}/opt/mongoose"

src_unpack() {
	default
	use test && git-r3_src_unpack
}

src_prepare() {
	eapply_user
	multilib_copy_sources
}

multilib_src_configure() {
	local mycmakeargs=(
		-DCMAKE_USE_OPENSSL=OFF # Doesn't do anything in this release
		-DBUILD_CPR_TESTS=$(usex test)
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_GTEST=ON
	)
	cmake-utils_src_configure
}

multilib_src_install() {
	dolib.a lib/libcpr.a
	doheader -r include/cpr
	dodoc CONTRIBUTING.md README.md AUTHORS
}
