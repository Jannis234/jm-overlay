# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Displays information about DOL files (Nintendo GameCube/Wii binaries)"
HOMEPAGE="http://wiibrew.org/wiki/Readdol"
SRC_URI="http://wiibrew.org/w/images/4/44/Readdol-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	app-arch/unzip"

src_prepare() {
	rm readdol.exe || die

	sed -i \
		-e "s/-g -O2//" \
		-e "s/gcc/${CHOST}-gcc/" \
		Makefile || die

	eapply_user
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	dobin readdol

	dodoc LICENSE.txt
}
