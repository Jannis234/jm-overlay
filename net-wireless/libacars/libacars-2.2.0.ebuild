# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A library for decoding various ACARS message payloads"
HOMEPAGE="https://github.com/szpajder/libacars"
SRC_URI="https://github.com/szpajder/libacars/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc json xml zlib"

DEPEND="json? ( dev-libs/jansson )
	xml? ( dev-libs/libxml2 )
	zlib? ( sys-libs/zlib:= )"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_MAKEFILE_GENERATOR="emake"

src_prepare() {
	eapply "${FILESDIR}/${P}-dont-install-docs.patch"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DJANSSON=$(usex json ON OFF)
		-DLIBXML2=$(usex xml ON OFF)
		-DZLIB=$(usex zlib ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodoc README.md CHANGELOG.md
	use doc && dodoc doc/*.md
}
