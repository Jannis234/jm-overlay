# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib eutils

DESCRIPTION="Utility to generate and verify checksums/hashes"
HOMEPAGE="https://sourceforge.net/projects/jm-checkmate/"
SRC_URI="https://downloads.sourceforge.net/project/jm-checkmate/${PV}/${P}-src.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="aot doc"

RDEPEND=">=dev-lang/mono-3"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${P}/CheckMate"

src_compile() {
	emake
	if use aot; then
		mono --aot -O=all bin/Release/CheckMate.exe || die
	fi
}

src_install() {
	emake install PREFIX="${D}/usr"
	if use aot; then
		insinto "/usr/$(get_libdir)/checkmate"
		doins bin/Release/CheckMate.exe.so
	fi

	rm -rf "${D}/usr/share/man" # Let portage handle manpages/docs
	rm -rf "${D}/usr/share/doc"
	doman checkmate.1
	dodoc README.txt ChangeLog.txt

	use doc && dodoc ./Doc/*
}

src_test() {
	cd Testsuite || die
	./run_tests.sh mono ../bin/Release/CheckMate.exe || die "Tests failed"
}
