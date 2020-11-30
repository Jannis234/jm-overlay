# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A powerful duplicate file finder and an enhanced fork of fdupes"
HOMEPAGE="https://github.com/jbruchon/jdupes"
SRC_URI="https://github.com/jbruchon/jdupes/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug kernel_linux -low_memory"

DEPEND=""
RDEPEND=""
BDEPEND=""

RESTRICT="test" # Broken

src_compile() {
	tc-export CC
	emake CFLAGS_EXTRA="${CFLAGS}" $(usex kernel_linux "ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1" "") $(usex debug "DEBUG=1 LOUD=1" "") $(usex low_memory "LOW_MEMORY=1" "")
}

src_install() {
	emake PREFIX="${ED}/usr" install
}
