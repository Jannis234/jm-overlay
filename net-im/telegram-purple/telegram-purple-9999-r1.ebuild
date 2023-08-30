# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Libpurple (Pidgin) plugin for using a Telegram account"
HOMEPAGE="https://github.com/majn/telegram-purple"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+webp"

DEPEND="net-im/pidgin
	dev-libs/openssl:0=
	webp? ( media-libs/libwebp )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s/-Werror//g" tgl/Makefile.in Makefile.mingw Makefile.tgl.mingw || die
	eapply_user
}

src_configure() {
	econf $(use_enable webp libwebp)
}
