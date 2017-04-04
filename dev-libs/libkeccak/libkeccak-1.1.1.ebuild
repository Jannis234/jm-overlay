# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Keccak-family hashing library"
HOMEPAGE="https://github.com/maandree/libkeccak"
SRC_URI="https://github.com/maandree/libkeccak/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-util/valgrind )
	sys-apps/texinfo"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s/install-lib install-copyright/install-lib/g" Makefile || die # Don't install the license
	eapply_user
}

src_compile() {
	tc-export CC
	emake
}
