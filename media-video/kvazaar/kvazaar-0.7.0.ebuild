# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib multilib-minimal

DESCRIPTION="Open-source HEVC encoder"
HOMEPAGE="http://ultravideo.cs.tut.fi/#encoder"
SRC_URI="https://github.com/ultravideo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs +cli-encoder doc"

DEPEND="dev-lang/yasm
	doc? ( app-doc/doxygen[dot] )"
RDEPEND=""

src_prepare() {
	cd src || die
	sed -i "s/-O2 -g //" Makefile || die # Filter CFLAGS
	sed -i "s/-O2 //" Makefile || die # Filter LDFLAGS

	multilib_copy_sources
}

multilib_src_compile() {
	cd src || die
	emake lib-shared ARCH=${ABI} CC="${CHOST}-gcc"
	use static-libs && emake lib-static ARCH=${ABI} CC="${CHOST}-gcc"
	if multilib_is_native_abi; then
		use cli-encoder && emake cli ARCH=${ABI} CC="${CHOST}-gcc"
		if use doc; then
			cd ..
			doxygen docs.doxy || die
		fi
	fi
}

multilib_src_install() {
	cd src || die
	emake install-lib PREFIX="${D}/usr" LIBDIR="${D}/usr/$(get_libdir)"
	emake install-pc PREFIX="${D}/usr" LIBDIR="${D}/usr/$(get_libdir)"
	use static-libs && emake install-static PREFIX="${D}/usr" LIBDIR="${D}/usr/$(get_libdir)"
	if multilib_is_native_abi; then
		use cli-encoder && emake install-prog PREFIX="${D}/usr"
		if use doc; then
			cd ..
			docinto "html"
			dohtml -r ./doxygen_html/* || die
		fi
	fi
}

multilib_src_install_all() {
	dodoc CREDITS README.md
}
