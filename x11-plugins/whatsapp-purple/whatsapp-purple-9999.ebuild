# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils git-r3

DESCRIPTION="WhatsApp protocol implementation for libpurple (Pidgin)"
HOMEPAGE="https://davidgf.net/whatsapp/"
EGIT_REPO_URI="https://github.com/davidgfnet/whatsapp-purple.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="net-im/pidgin
	media-libs/freeimage
	dev-libs/protobuf"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="README.md"

src_prepare() {
	sed -i \
		-e "/-O2/d" \
		-e "s/-pipe//" \
		Makefile || die # Remove CFLAGS/LDFLAGS that should be chosen by the user

	sed -i \
		-e "/-shared/aCFLAGS += \$(CUSTOM_CFLAGS)\nLDFLAGS += \$(CUSTOM_LDFLAGS)" \
		Makefile || die

	epatch_user
}

src_compile() {
	emake CUSTOM_CFLAGS="${CFLAGS}" CUSTOM_LDFLAGS="${LDFLAGS}" || die
}
