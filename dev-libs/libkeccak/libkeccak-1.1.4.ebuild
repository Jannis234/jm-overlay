# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs multilib-minimal

DESCRIPTION="Keccak-family hashing library"
HOMEPAGE="https://github.com/maandree/libkeccak"
SRC_URI="https://github.com/maandree/libkeccak/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-util/valgrind )
	sys-apps/texinfo"
RDEPEND=""

src_prepare() {
	sed -i "/LICENSE/d" Makefile || die # Don't install the license
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
