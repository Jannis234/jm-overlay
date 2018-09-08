# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Libpurple (Pidgin) plugin for using a Telegram account"
HOMEPAGE="https://github.com/majn/telegram-purple"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+webp libressl"

DEPEND="net-im/pidgin
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	webp? ( media-libs/libwebp )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s/-Werror//g" tgl/Makefile.in Makefile.mingw Makefile.tgl.mingw || die
	eapply_user
}

src_configure() {
	econf $(use_enable webp libwebp)
}
