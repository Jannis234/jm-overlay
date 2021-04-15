# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-minimal toolchain-funcs

DESCRIPTION="C++ library providing some cryptographic primitives"
HOMEPAGE="http://cppcrypto.sourceforge.net/"
SRC_URI="https://sourceforge.net/projects/cppcrypto/files/${P}-src.zip"

LICENSE="BSD-2 BSD"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip
	dev-lang/yasm"

S="${WORKDIR}/cppcrypto"

src_prepare() {
	eapply_user
	eapply "${FILESDIR}/${P}-Makefile.patch"
	eapply "${FILESDIR}/${P}-include-stdexcept.patch"
	multilib_copy_sources
}

platform64bit() {
	use amd64 && multilib_is_native_abi && echo 1 && return
	echo 0
}

multilib_src_compile() {
	emake PLATFORM64BIT="$(platform64bit)" CC="$(tc-getCC)" CXX="$(tc-getCXX)" USER_CFLAGS="${CFLAGS}" USER_CXXFLAGS="${CXXFLAGS}" USER_LDFLAGS="${LDFLAGS}"
}

multilib_src_install() {
	emake PLATFORM64BIT="$(platform64bit)" DESTDIR="${D}" PREFIX="${EPREFIX}/usr" LIBDIR="${EPREFIX}/usr/$(get_libdir)" install
	use static-libs || rm "${ED}/usr/$(get_libdir)/libcppcrypto.a"
}

multilib_src_install_all() {
	cd "${WORKDIR}/doc" || die
	dodoc ChangeLog.txt readme.html
}
