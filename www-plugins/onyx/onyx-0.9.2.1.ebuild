# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Native component for OverbiteNX, a Gopher client add-on for Firefox"
HOMEPAGE="https://github.com/classilla/overbitenx"
SRC_URI="https://github.com/classilla/overbitenx/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="FFSL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/overbitenx-${PV}"

src_prepare() {
	sed -i "s/ -g//g" Makefile.generic || die
	sed -i "s|/home/linus/bin/onyx|/usr/bin/onyx|g" EXAMPLE_onyx.json || die
	eapply_user
}

src_compile() {
	emake -f Makefile.generic CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin onyx
	insinto "/usr/$(get_libdir)/mozilla/native-messaging-hosts"
	newins EXAMPLE_onyx.json onyx.json
}
