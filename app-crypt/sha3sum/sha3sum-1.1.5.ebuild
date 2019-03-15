# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="SHA-3 and Keccak checksum utility"
HOMEPAGE="https://github.com/maandree/sha3sum"
SRC_URI="https://github.com/maandree/sha3sum/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libkeccak"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i "/licenses/d" Makefile || die # Don't install the license
	sed -i "s/-O3/\$(CFLAGS_CUSTOM)/g" config.mk || die
	sed -i "s/-s -lkeccak/-lkeccak/g" config.mk || die
	eapply_user
}

src_compile() {
	tc-export CC
	emake CFLAGS_CUSTOM="${CFLAGS}" LDFLAGS="-lkeccak"
}

src_install() {
	emake install PREFIX="${EPREFIX}/usr" DESTDIR="${D}"
	dodoc README
}
