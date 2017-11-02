# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="SHA-3 and Keccak checksum utility"
HOMEPAGE="https://github.com/maandree/sha3sum"
SRC_URI="https://github.com/maandree/sha3sum/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libkeccak"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i "/LICENSE/d" Makefile || die # Don't install the license
	sed -i "s/-O3/\$(CFLAGS_CUSTOM)/g" Makefile || die
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
