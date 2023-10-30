# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="C++ library providing some cryptographic primitives"
HOMEPAGE="http://cppcrypto.sourceforge.net/"
SRC_URI="https://sourceforge.net/projects/cppcrypto/files/${P}-src.zip"

LICENSE="BSD-2 BSD"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip
	dev-lang/yasm"

S="${WORKDIR}/${P}-src/cppcrypto"

src_prepare() {
	eapply_user
	eapply "${FILESDIR}/${P}-Makefile.patch"
}

src_compile() {
	emake PLATFORM64BIT=1 CC="$(tc-getCC)" CXX="$(tc-getCXX)" USER_CFLAGS="${CFLAGS}" USER_CXXFLAGS="${CXXFLAGS}" USER_LDFLAGS="${LDFLAGS}"
}

src_install() {
	emake PLATFORM64BIT=1 DESTDIR="${D}" PREFIX="${EPREFIX}/usr" LIBDIR="${EPREFIX}/usr/$(get_libdir)" install
	use static-libs || rm "${ED}/usr/$(get_libdir)/libcppcrypto.a"

	cd "${WORKDIR}/${P}-src/doc" || die
	dodoc ChangeLog.txt readme.html
}
