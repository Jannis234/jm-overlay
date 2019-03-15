# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs multilib-minimal

DESCRIPTION="Keccak-family hashing library"
HOMEPAGE="https://github.com/maandree/libkeccak"
SRC_URI="https://github.com/maandree/libkeccak/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="sys-apps/texinfo"
DEPEND="test? ( dev-util/valgrind )"
RDEPEND=""

src_prepare() {
	sed -i "/licenses/d" Makefile || die # Don't install the license
	eapply_user
	multilib_copy_sources
}

multilib_src_configure() {
	sed -i "s|(PREFIX)/lib|(PREFIX)/$(get_libdir)|g" Makefile || die
}

multilib_src_compile() {
	tc-export CC
	emake CFLAGS="${CFLAGS}" LDFLAGS=""
}

multilib_src_install() {
	emake install PREFIX="${EPREFIX}/usr" DESTDIR="${D}"
}
