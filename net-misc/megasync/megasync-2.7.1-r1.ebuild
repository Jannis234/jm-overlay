# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit qmake-utils git-r3 autotools eutils

DESCRIPTION="Automated syncing between your computers and your MEGA cloud drive"
HOMEPAGE="https://mega.nz/ https://github.com/meganz/MEGAsync https://github.com/meganz/sdk"
MEGASYNC_COMMIT="fd9cafb46ca9287ae2871aca24ea336a99fc9363"
SDK_REPO_URI="https://github.com/meganz/sdk.git"
# Upstream uses the master branch by default, this is the latest SDK commit before the MEGASync release
SDK_COMMIT="ad50d1188a8ea0d87c4d2425e446c0600638bb3c"
SRC_URI="https://github.com/meganz/MEGAsync/archive/${MEGASYNC_COMMIT}.zip -> ${PN}-${MEGASYNC_COMMIT}.zip"

LICENSE="MEGA-Code-Review BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="bindist"
S="${WORKDIR}/MEGAsync-${MEGASYNC_COMMIT}"

RDEPEND="dev-libs/crypto++
	sys-libs/zlib
	dev-db/sqlite:3
	net-dns/c-ares
	net-misc/curl[ssl,curl_ssl_openssl]
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtdbus:4"
DEPEND="${RDEPEND}
	app-arch/unzip"

src_unpack() {
	# Upstream uses git submodules, but recursive fetching trys to use git over ssh
	# This results in an interactive ssh prompt during src_unpack
	# To work around this, download the MEAGSync repo as a zip file from github
	default

	git-r3_fetch ${SDK_REPO_URI} ${SDK_COMMIT}
	git-r3_checkout ${SDK_REPO_URI} "${S}/src/MEGASync/mega"
}

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
	dodoc README.md

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
