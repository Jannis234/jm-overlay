# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DB_VER="4.8"

LANGS="ach af_ZA ar be_BY bg bs ca_ES ca ca@valencia cmn cs cy da de el_GR en eo es_CL es_DO es_MX es es_UY et eu_ES fa_IR fa fi fr_CA fr gl gu_IN he hi_IN hr hu id_ID it ja ka kk_KZ ko_KR ky la lt lv_LV mn ms_MY nb nl pam pl pt_BR pt_PT ro_RO ru sah sk sl_SI sq sr sv th_TH tr uk ur_PK uz@Cyrl vi vi_VN zh_CN zh_HK zh_TW"

inherit autotools db-use eutils fdo-mime gnome2-utils kde4-functions qt4-r2

MyPV="${PV/_/-}"
MyPN="digitalcoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="A Currency for the digital age"
HOMEPAGE="http://digitalcoin.org/"
SRC_URI="https://github.com/DGCDev/${MyPN}/archive/v${MyPV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="MIT BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dbus kde +qrcode upnp"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	dev-libs/protobuf:=
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

DOCS="doc/README.md doc/release-notes.md"

S="${WORKDIR}/${MyP}"

src_prepare() {
	eautoreconf

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
			#rm "$ts"
			filt="$filt\\|$x"
		else
			yeslang="$yeslang $x"
		fi
	done

	filt="bitcoin_\\(${filt:2}\\)\\.\(qm\|ts\)"
	sed "/${filt}/d" -i 'qt/bitcoin_locale.qrc'
	einfo "Languages -- Enabled:$yeslang -- Disabled:$nolang"

	epatch_user
}

src_configure() {
	local my_econf=
	if use upnp; then
		my_econf="${my_econf} --with-miniupnpc --enable-upnp-default"
	else
		my_econf="${my_econf} --without-miniupnpc --disable-upnp-default"
	fi
	econf \
		--enable-wallet \
		--disable-ccache \
		--disable-tests \
		--without-cli \
		--without-daemon  \
        --with-gui \
        $(use_with dbus qtdbus)  \
        $(use_with qrcode qrencode)  \
		${my_econf}
}

src_install() {
	default

	insinto /usr/share/pixmaps
	newins "share/pixmaps/bitcoin128.png" "${PN}.png"

	make_desktop_entry "${PN} %u" "Digitalcoin-Qt" "/usr/share/pixmaps/${PN}.png" "Qt;Network;P2P;Office;Finance;" "Terminal=false"

	#newman contrib/debian/manpages/bitcoin-qt.1 ${PN}.1

	#if use kde; then
	#	insinto /usr/share/kde4/services
	#	doins contrib/debian/dogecoin-qt.protocol
	#fi
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
