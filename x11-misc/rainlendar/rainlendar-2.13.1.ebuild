# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Customizable calendar application on your desktop"
HOMEPAGE="http://www.rainlendar.net/"
SRC_URI="!pro? (
		amd64? ( http://www.rainlendar.net/download/Rainlendar-Lite-${PV}-amd64.tar.bz2 )
		x86? ( http://www.rainlendar.net/download/Rainlendar-Lite-${PV}-i386.tar.bz2 )
	)
	pro? (
		amd64? ( http://www.rainlendar.net/download/Rainlendar-Pro-${PV}-amd64.tar.bz2 )
		x86? ( http://www.rainlendar.net/download/Rainlendar-Pro-${PV}-i386.tar.bz2 )
	)
	http://www.rainlendar.net/download/Rainlendar.png"

LICENSE="Rainlendar"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
RAINLENDAR_LANGS="bs ca:ca_ES cs:cs_CZ da:da_DK de:de_DE es:es_ES et:et_EE fi:fi_FI fr:fr_FR he:he_IL hi:hi_IN hu:hu_HU hy id:id_ID it:it_IT ja:ja_JP ko:ko_KR lt:lt_LT nb:nb_NO nl:nl_NL pl:pl_PL pt-BR:pt_BR pt-PT:pt_PT ro:ro_RO ru:ru_RU sk:sk_SK sr:sr_SR sv:sv_SE th:th_TH tr:tr_TR uk:uk_UA zh-CN:zh_CN zh-TW:zh_TW"
IUSE="pro"
for lang in $RAINLENDAR_LANGS; do
	IUSE="${IUSE} l10n_${lang%:*}"
done

DEPEND=""
RDEPEND="x11-libs/libX11
	x11-libs/libSM
	net-libs/webkit-gtk:2
	x11-libs/gtk+:2
	x11-libs/pango
	x11-libs/gdk-pixbuf:2
	x11-libs/cairo
	dev-libs/glib:2
	sys-libs/zlib
	media-libs/libpng:1.2
	media-libs/jpeg:8
	dev-libs/expat
	net-dns/libidn
	media-libs/libcanberra"

RESTRICT="bindist mirror"
S="${WORKDIR}/rainlendar2"
QA_PREBUILT="${EROOT}opt/${PN}/rainlendar2
	${EROOT}opt/${PN}/lfs.so
	${EROOT}opt/${PN}/plugins/*"

src_unpack() {
	default
	cp "${DISTDIR}/Rainlendar.png" "${WORKDIR}/${PN}.png"
}

src_prepare() {
	default

	for locale in ${RAINLENDAR_LANGS}; do
		if ! use l10n_${locale%:*}; then
			rm -r locale/${locale#*:} || die
		fi
	done
}

src_install() {
	dodoc Changes.txt
	rm Changes.txt License.txt || die

	insinto "/opt/${PN}"
	doins -r ./*
	chmod +x "${D}/opt/${PN}/rainlendar2" || die

	dosym "${EROOT}opt/${PN}/rainlendar2" /opt/bin/rainlendar2
	doicon "${WORKDIR}/${PN}.png"
	make_desktop_entry "${EROOT}opt/${PN}/rainlendar2" "Rainlendar" "${PN}"
}
