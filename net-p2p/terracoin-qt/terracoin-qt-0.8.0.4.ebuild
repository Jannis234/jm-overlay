# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DB_VER="4.8"

LANGS="bg ca_ES cs da de el_GR en es_CL es et eu_ES fa_IR fa fi fr_CA fr gu_IN he hi_IN hr hu it ja lt nb nl pl pt_BR pt_PT ro_RO ru sk sr sv th_TH tr uk zh_CN zh_TW"
inherit db-use eutils fdo-mime gnome2-utils kde4-functions qt4-r2

MyPV="${PV/_/-}"
MyPN="terracoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Digital currency with no central authority, no chargeback, low transaction fees"
HOMEPAGE="http://www.terracoin.org/"
SRC_URI="https://github.com/${MyPN}/${MyPN}/archive/v${PV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="MIT BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dbus ipv6 +qrcode upnp kde"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	qrcode? (
		media-gfx/qrencode
	)
	upnp? (
		net-libs/miniupnpc
	)
	sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	dev-qt/qtgui:4
	dbus? (
		dev-qt/qtdbus:4
	)
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
"

S="${WORKDIR}/${MyP}"

src_prepare() {
	cd src || die

	local filt= yeslang= nolang=

	for lan in $LANGS; do
		if [ ! -e qt/locale/bitcoin_$lan.ts ]; then
			ewarn "Language '$lan' no longer supported. Ebuild needs update."
		fi
	done

	for ts in $(ls qt/locale/*.ts)
	do
		x="${ts/*bitcoin_/}"
		x="${x/.ts/}"
		if ! use "linguas_$x"; then
			nolang="$nolang $x"
			rm "$ts"
			filt="$filt\\|$x"
		else
			yeslang="$yeslang $x"
		fi
	done

	filt="bitcoin_\\(${filt:2}\\)\\.\(qm\|ts\)"
	sed "/${filt}/d" -i 'qt/terracoin.qrc' || die
	einfo "Languages -- Enabled:$yeslang -- Disabled:$nolang"

	epatch_user
}

src_configure() {
	OPTS=()

	use dbus && OPTS+=("USE_DBUS=1")
	if use upnp; then
		OPTS+=("USE_UPNP=1")
	else
		OPTS+=("USE_UPNP=-")
	fi

	use qrcode && OPTS+=("USE_QRCODE=1")
	use ipv6 || OPTS+=("USE_IPV6=-")

	OPTS+=("BDB_INCLUDE_PATH=$(db_includedir "${DB_VER}")")
	OPTS+=("BDB_LIB_SUFFIX=-${DB_VER}")

	if has_version '>=dev-libs/boost-1.52'; then
		OPTS+=("LIBS+=-lboost_chrono\$\$BOOST_LIB_SUFFIX")
	fi

	eqmake4 terracoin-qt.pro "${OPTS[@]}" || die
}

src_install() {
#	qt4-r2_src_install

	dobin ${PN}

	insinto /usr/share/pixmaps
	newins "src/qt/res/icons/bitcoin.png" "${PN}.png"

	make_desktop_entry "${PN} %u" "Terracoin-Qt" "/usr/share/pixmaps/${PN}.png" "Qt;Network;P2P;Office;Finance;" "Terminal=false"

#	newman contrib/debian/manpages/bitcoin-qt.1 ${PN}.1

#	if use kde; then
#		insinto /usr/share/kde4/services
#		newins contrib/debian/bitcoin-qt.protocol ${PN}.protocol
#	fi
}

update_caches() {
	gnome2_icon_cache_update
	fdo-mime_desktop_database_update
	buildsycoca
}

pkg_postinst() {
	update_caches
}

pkg_postrm() {
	update_caches
}
