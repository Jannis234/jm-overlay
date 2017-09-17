# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib-minimal toolchain-funcs

DESCRIPTION="Zstd, short for Zstandard, is a lossless compression algorithm"
HOMEPAGE="https://github.com/Cyan4973/zstd"
SRC_URI="https://github.com/Cyan4973/${PN}/archive/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs +tools test"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	sed -i "s/install: libzstd/install:/" lib/Makefile || die # Avoid recompiling during src_install
	sed -i "s/install: zstd/install:/" programs/Makefile || die

	epatch_user

	multilib_copy_sources
}

multilib_src_compile() {
	cd ./lib || die
	emake CFLAGS="${CFLAGS} $(get_abi_CFLAGS)" PREFIX="${D}/usr" CC="$(tc-getCC)" LIBDIR="${D}/usr/$(get_libdir)"
	cd ..

	if (use tools && multilib_is_native_abi) || use test; then
		cd ./programs || die
		emake CFLAGS="${CFLAGS} $(get_abi_CFLAGS)" PREFIX="${D}/usr" CC="$(tc-getCC)" LIBDIR="${D}/usr/$(get_libdir)"
		cd ..
	fi
}

multilib_src_install() {
	cd ./lib || die
	emake install CFLAGS="${CFLAGS} $(get_abi_CFLAGS)" PREFIX="${D}/usr" CC="$(tc-getCC)" LIBDIR="${D}/usr/$(get_libdir)"
	cd ..

	if use tools && multilib_is_native_abi; then
		cd ./bin
		emake install CFLAGS="${CFLAGS} $(get_abi_CFLAGS)" PREFIX="${D}/usr" CC="$(tc-getCC)" LIBDIR="${D}/usr/$(get_libdir)"
		cd ..
	fi

	if ! use static-libs; then
		einfo "deleting static library"
		rm "${D}"/usr/$(get_libdir)/libzstd.a || die
	fi
}

multilib_src_install_all() {
	dodoc README.md NEWS
}

multilib_src_test() {
	cd ./programs || die
	emake test
}
