# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils desktop

MyPN="Sachesi"
MyP="${MyPN}-${PV}"

DESCRIPTION="Firmware, extractor, searcher and installer for Blackberry 10"
HOMEPAGE="https://github.com/xsacha/Sachesi"
SRC_URI="https://github.com/xsacha/Sachesi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libressl"

S="${WORKDIR}/${MyP}"

RDEPEND="dev-qt/qtcore:5=
	dev-qt/qtnetwork:5=
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5=
	dev-libs/quazip
	sys-libs/zlib:=
	virtual/libudev:=
	dev-libs/lzo:2
	virtual/libusb:1
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:= )"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}/${P}-libressl.patch"
	eapply_user
}

src_configure() {
	eqmake5 Sachesi.pro CONFIG+="shared_quazip shared_lzo2"
}

src_install() {
	newbin Sachesi sachesi
	doicon assets/sachesi.png
	make_desktop_entry sachesi Sachesi sachesi
	dodoc README.md
}
