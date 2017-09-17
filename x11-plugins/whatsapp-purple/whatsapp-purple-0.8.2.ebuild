# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="WhatsApp protocol implementation for libpurple (Pidgin)"
HOMEPAGE="https://davidgf.net/whatsapp/"
SRC_URI="https://github.com/davidgfnet/whatsapp-purple/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin
	media-libs/freeimage"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	sed -i \
		-e "/-O2/d" \
		-e "s/-pipe//" \
		Makefile || die # Remove CFLAGS/LDFLAGS that should be chosen by the user

	sed -i \
		-e "/-shared/aCFLAGS += \$(CUSTOM_CFLAGS)\nLDFLAGS += \$(CUSTOM_LDFLAGS)" \
		Makefile || die
}

src_compile() {
	emake CUSTOM_CFLAGS="${CFLAGS}" CUSTOM_LDFLAGS="${LDFLAGS}" || die
}
