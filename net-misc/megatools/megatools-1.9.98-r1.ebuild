# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1
inherit autotools-utils eutils

DESCRIPTION="Command line tools and C library for accessing Mega cloud storage"
HOMEPAGE="https://github.com/megous/megatools"
SRC_URI="https://github.com/megous/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc libressl"

COMMON_DEPEND="dev-libs/glib:2
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:= )
	net-misc/curl"
RDEPEND="${COMMON_DEPEND}
	net-libs/glib-networking[ssl]"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	doc? ( app-text/asciidoc )"

src_prepare() {
	epatch "${FILESDIR}/${P}-libressl.patch"
	epatch_user

	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_enable doc docs)
		--disable-silent-rules
	)
	autotools-utils_src_configure
}
