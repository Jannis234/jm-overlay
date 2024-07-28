# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib multibuild

DESCRIPTION="Light-weight brokerless messaging"
HOMEPAGE="https://nng.nanomsg.org/"
SRC_URI="https://github.com/nanomsg/nng/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
# compat and deprecated match upstream's default choice
IUSE="+compat +deprecated doc ssl static-libs test tools"

DEPEND="ssl? ( net-libs/mbedtls[${MULTILIB_USEDEP}] )"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( dev-ruby/asciidoctor )"

RESTRICT="test" # Needs network

DOCS=(README.adoc RELEASE_NOTES.adoc docs/RATIONALE.adoc)

multilib_src_configure() {
	myconfig() {
		local mycmakeargs=(
			-DNNG_ELIDE_DEPRECATED=$(usex deprecated OFF ON)
			-DNNG_ENABLE_COMPAT=$(usex compat ON OFF)
			-DNNG_ENABLE_TLS=$(usex ssl ON OFF)
			-DNNG_TESTS=$(usex test ON OFF)
		)
		if [[ ${MULTIBUILD_VARIANT} = static-libs ]]; then
			# Build tools against the shared library
			mycmakeargs+=(
				-DBUILD_SHARED_LIBS=OFF
				-DNNG_ENABLE_DOC=OFF
				-DNNG_ENABLE_NNGCAT=OFF
				-DNNG_TOOLS=OFF
			)
		else
			mycmakeargs+=( -DBUILD_SHARED_LIBS=ON )
			if multilib_is_native_abi; then
				mycmakeargs+=(
					-DNNG_ENABLE_DOC=$(usex doc ON OFF)
					-DNNG_ENABLE_NNGCAT=$(usex tools ON OFF)
					-DNNG_TOOLS=$(usex tools ON OFF)
				)
			else
				mycmakeargs+=(
					-DNNG_ENABLE_DOC=OFF
					-DNNG_ENABLE_NNGCAT=OFF
					-DNNG_TOOLS=OFF
				)
			fi
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

multilib_src_test() {
	MULTIBUILD_VARIANTS=($(usev static-libs) shared)
	multibuild_foreach_variant cmake_src_compile test
}
