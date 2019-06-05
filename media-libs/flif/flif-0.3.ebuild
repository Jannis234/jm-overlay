# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs multilib-minimal

MyPN="FLIF"
MyP="${MyPN}-${PV}"

DESCRIPTION="Free lossless image format library"
HOMEPAGE="https://github.com/FLIF-hub/FLIF"
SRC_URI="https://github.com/FLIF-hub/FLIF/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3+ Apache-2.0 sdl? ( CC0-1.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdl"

DEPEND="media-libs/libpng:=[${MULTILIB_USEDEP}]
	sdl? ( media-libs/libsdl2 )"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${MyP}"
DOCS=( README.md CONTRIBUTING.md )

src_prepare() {
	# Remove hardcoded CFLAGS, respect multilib LIBDIR, don't strip during install
	eapply "${FILESDIR}/${P}-makefile.patch"
	eapply_user
	multilib_copy_sources
}

multilib_src_compile() {
	cd src || die
	tc-export CC CXX PKG_CONFIG
	emake all decoder OPTIMIZATIONS="${CXXFLAGS}" LIB_OPTIMIZATIONS="${CXXFLAGS}"
	if use sdl && multilib_is_native_abi; then
		emake viewflif
	fi
}

multilib_src_install() {
	cd src || die
	if multilib_is_native_abi; then
		emake install install-decoder install-dev PREFIX="${ED}/usr" LIBDIR="$(get_libdir)"
		use sdl && emake install-viewflif PREFIX="${ED}/usr"
	else
		emake install-dev PREFIX="${ED}/usr"
		dolib.so libflif.* libflif_dec.* # No makefile rule to only install the library
	fi
}
