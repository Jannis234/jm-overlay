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
IUSE="doc"

RDEPEND="dev-libs/libkeccak
	dev-libs/argparser"
DEPEND="${RDEPEND}
	doc? ( sys-apps/texinfo )"

src_prepare() {
	sed -i "/-O3/d" Makefile || die
	eapply_user
}

src_compile() {
	tc-export CC
	emake command
	use doc && emake info
}

src_install() {
	export DESTDIR="${D}"
	emake install-command
	use doc && emake install-info
	dodoc README TODO
}
