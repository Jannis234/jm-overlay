# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils git-r3 autotools eutils

DESCRIPTION="Automated syncing between your computers and your MEGA cloud drive"
HOMEPAGE="https://mega.nz/ https://github.com/meganz/MEGAsync https://github.com/meganz/sdk"
EGIT_REPO_URI="https://github.com/meganz/MEGAsync.git"
EGIT_REPO_COMMIT="e46bc5e7ea6848e862365ec491ee8f125bdd93a8"

LICENSE="MEGA-Code-Review BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="bindist"

RDEPEND="dev-libs/crypto++
	sys-libs/zlib
	dev-db/sqlite:3
	net-dns/c-ares
	net-misc/curl[ssl]
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtdbus:4"
DEPEND="${RDEPEND}
	app-arch/unzip"

src_prepare() {
	default

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
	eqmake4 MEGA.pro
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
