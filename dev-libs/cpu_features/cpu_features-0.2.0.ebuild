# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-multilib multibuild

GTEST_COMMIT="34d5d22b6441fd7d91898a48097a18e29d137ace"

DESCRIPTION="A cross platform C99 library to get cpu features at runtime"
HOMEPAGE="https://github.com/google/cpu_features"
SRC_URI="https://github.com/google/cpu_features/archive/v${PV}.tar.gz -> ${P}.tar.gz"

# Googletest
EGIT_REPO_URI="https://github.com/google/googletest.git"
EGIT_COMMIT="34d5d22b6441fd7d91898a48097a18e29d137ace"
EGIT_CHECKOUT_DIR="${S}/googletest-download"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs test"

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-util/cmake-3.0"

DOCS=( README.md CONTRIBUTING.md )

multibuild_foreach_helper() {
	MULTIBUILD_VARIANTS=( shared )
	use static-libs && MULTIBUILD_VARIANTS+=( static )
	multibuild_foreach_variant $1
}

src_unpack() {
	default
	if use test; then
		git-r3_src_unpack
		ln -s "${S}/googletest-download" "${S}/googletest-src"
	fi
}

src_prepare() {
	eapply "${FILESDIR}/${P}-gtest-download.patch" # Don't download gtest at build time
	eapply "${FILESDIR}/${P}-program-conditional.patch" # Prevent installing list_cpu_features for non-native ABIs
	cmake-utils_src_prepare
	if use test; then
		MULTIBUILD_VARIANTS=( shared )
		use static-libs && MULTIBUILD_VARIANTS+=( static )
		multibuild_copy_sources
		multibuild_foreach_variant multilib_copy_sources
	fi
}

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING="$(usex test)"
	)
	if [[ ${MULTIBUILD_ID} == shared-* ]]; then
		mycmakeargs+=( -DBUILD_SHARED_LIBS=ON )
		multilib_is_native_abi && mycmakeargs+=( -DBUILD_PROGRAM=ON )
	fi
	cmake-utils_src_configure
}

src_configure() {
	multibuild_foreach_helper cmake-multilib_src_configure
}

src_compile() {
	multibuild_foreach_helper cmake-multilib_src_compile
}

multilib_src_install() {
	case ${MULTIBUILD_ID} in
		shared-*)
			cmake-utils_src_install
			;;
		static-*)
			dolib.a "libcpu_features.a"
			;;
	esac
}

src_install() {
	multibuild_foreach_helper cmake-multilib_src_install
}

src_test() {
	multibuild_foreach_helper cmake-multilib_src_test
}
