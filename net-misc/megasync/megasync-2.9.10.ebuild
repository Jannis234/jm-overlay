# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils git-r3 autotools eutils

DESCRIPTION="Automated syncing between your computers and your MEGA cloud drive"
HOMEPAGE="https://mega.nz/ https://github.com/meganz/MEGAsync https://github.com/meganz/sdk"
EGIT_REPO_URI="https://github.com/meganz/MEGAsync.git"
EGIT_COMMIT="2e03defad7e732afe5ffd6977eeb10558f25457b"

LICENSE="MEGA-Code-Review BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5 libressl"

RESTRICT="bindist"

RDEPEND="dev-libs/crypto++
	sys-libs/zlib
	dev-db/sqlite:3
	net-dns/c-ares
	!libressl? (
		net-misc/curl[ssl,curl_ssl_openssl]
	)
	libressl? (
		net-misc/curl[ssl,curl_ssl_libressl]
	)
	!qt5? (
		dev-qt/qtcore:4
		dev-qt/qtgui:4
		dev-qt/qtdbus:4
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtdbus:5
		dev-qt/qtwidgets:5
		dev-qt/qtnetwork:5
	)"
DEPEND="${RDEPEND}
	app-arch/unzip"

src_prepare() {
	default

	eapply "${FILESDIR}/megasync-libressl.patch"

	cd src/MEGASync/mega || die
	eautoreconf
}

src_configure() {
	cd src/MEGASync/mega || die
	econf \
		--disable-curl-checks \
		--disable-megaapi \
		--with-cryptopp \
		--with-zlib \
		--with-cares \
		--with-curl \
		--without-sodium \
		--without-freeimage \
		--without-readline \
		--without-termcap \
		--disable-posix-threads \
		--disable-examples

	cd ../.. || die
	$(usex qt5 eqmake5 eqmake4) MEGA.pro
}

src_compile() {
	cd src || die
	lrelease MEGASync/MEGASync.pro || die
	emake
}

src_install() {
	dodoc README.md CREDITS.md

	cd src/MEGASync || die
	dobin megasync

	cd platform/linux/data || die
	insinto /usr/share/applications
	doins megasync.desktop

	cd icons/hicolor || die
	for size in 16 32 48 128 256; do
		doicon -s ${size} ${size}x${size}/apps/mega.png
	done
}
