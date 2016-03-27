# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit multilib-minimal

DESCRIPTION="C library to handle the Public Suffix List"
HOMEPAGE="https://github.com/rockdaboot/libpsl"
SRC_URI="https://github.com/rockdaboot/${PN}/releases/download/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +icu -libidn -libidn2 +builtin-psl +idn"
REQUIRED_USE="builtin-psl? ( ^^ ( icu libidn libidn2 ) )
	idn? ( ^^ ( icu libidn libidn2 ) )
	!builtin-psl? ( !idn? ( !icu !libidn !libidn2 ) )"

RDEPEND="icu? ( dev-libs/icu:=[${MULTILIB_USEDEP}] )
	libidn? (
		net-dns/libidn[${MULTILIB_USEDEP}]
		dev-libs/libunistring[${MULTILIB_USEDEP}]
	)
	libidn2? (
		net-dns/libidn2[${MULTILIB_USEDEP}]
		dev-libs/libunistring[${MULTILIB_USEDEP}]
	)"
DEPEND="${RDEPEND}
	doc? ( dev-util/gtk-doc )"

src_prepare() {
	multilib_copy_sources
	eapply_user
}

multilib_src_configure() {
	if use icu; then
		idnalib="libicu"
	else
		idnalib=$(usex idn2 libidn2 libidn)
	fi

	if multilib_is_native_abi; then
		docconf="--enable-man \
			$(use_enable doc gtk-doc) \
			$(use_enable doc gtk-doc-html)"
	else
		docconf="--disable-man \
			--disable-gtk-doc \
			--disable-gtk-doc-html"
	fi

	econf \
		${docconf} \
		--disable-gtk-doc-pdf \
		$(use_enable builtin-psl builtin ${idnalib}) \
		$(use_enable idn runtime ${idnalib})
}
