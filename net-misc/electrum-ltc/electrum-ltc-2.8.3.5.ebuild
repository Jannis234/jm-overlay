# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ncurses?"

inherit distutils-r1 gnome2-utils

MyPN="Electrum-LTC"
MyP="${MyPN}-${PV}"

DESCRIPTION="Litecoin thin client"
HOMEPAGE="https://electrum-ltc.org/"
SRC_URI="https://electrum-ltc.org/download/${MyP}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# l10n_* USE flags with folder names in lib/locale
LANGS="ar.ar_SA bg.bg_BG cs.cs_CZ da.da_DK de.de_DE el.el_GR eo.eo_UY es.es_ES fr.fr_FR hu.hu_HU hy.hy_AM id.id_ID it.it_IT ja.ja_JP ko.ko_KR ky.ky_KG lv.lv_LV nb.nb_NO nl.nl_NL pl.pl_PL pt-BR.pt_BR pt-PT.pt_PT ro.ro_RO ru.ru_RU sk.sk_SK sl.sl_SI ta.ta_IN th.th_TH tr.tr_TR uk.uk_UA vi.vi_VN zh-CN.zh_CN zh-TW.zh_TW"
IUSE="audio_modem cli cosign digitalbitbox email ncurses qrcode +qt4 sync vkb"
for lang in ${LANGS}; do
	IUSE+=" l10n_${lang%%.*}"
done

REQUIRED_USE="|| ( cli ncurses qt4 )
	audio_modem? ( qt4 )
	cosign? ( qt4 )
	digitalbitbox? ( qt4 )
	email? ( qt4 )
	qrcode? ( qt4 )
	sync? ( qt4 )
	vkb? ( qt4 )"

RDEPEND="dev-python/ltc_scrypt[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]
	dev-python/jsonrpclib[${PYTHON_USEDEP}]
	dev-python/pbkdf2[${PYTHON_USEDEP}]
	dev-python/pyaes[${PYTHON_USEDEP}]
	dev-python/PySocks[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/tlslite[${PYTHON_USEDEP}]
	dev-libs/protobuf[python,${PYTHON_USEDEP}]
	virtual/python-dnspython[${PYTHON_USEDEP}]
	qrcode? ( media-gfx/zbar[python,v4l,${PYTHON_USEDEP}] )
	qt4? (
		dev-python/PyQt4[X,${PYTHON_USEDEP}]
	)
	ncurses? ( dev-lang/python )"

S="${WORKDIR}/${MyP}"

DOCS=( AUTHORS README.rst RELEASE-NOTES )

src_prepare() {
	eapply "${FILESDIR}/2.8.3.5-no-user-root.patch"

	# Prevent icon from being installed in the wrong location
	sed -i '/icons/d' setup.py || die

	# Remove unrequested localization files:
	for lang in ${LANGS}; do
		use "l10n_${lang%%.*}" && continue
		rm -r "lib/locale/${lang#*.}" || die
	done

	local wordlist=
	for wordlist in \
		$(usex l10n_ja '' japanese) \
		$(usex l10n_pt-BR '' $(usex l10n_pt-PT '' portuguese)) \
		$(usex l10n_es '' spanish) \
		$(usex l10n_zh-CN '' chinese_simplified) \
	; do
		rm -f "lib/wordlist/${wordlist}.txt" || die
		sed -i "/${wordlist}\\.txt/d" lib/mnemonic.py || die
	done

	# Remove unrequested GUI implementations:
	local gui setup_py_gui
	for gui in \
		$(usex cli '' stdio)  \
		kivy \
		$(usex qt4 '' qt)  \
		$(usex ncurses '' text)  \
	; do
		rm gui/"${gui}"* -r || die
	done

	# And install requested ones...
	for gui in \
		$(usex qt4 qt '') \
	; do
		setup_py_gui="${setup_py_gui}'electrum_gui.${gui}',"
	done

	sed -i "s/'electrum_gui\\.qt',/${setup_py_gui}/" setup.py || die

	local bestgui
	if use qt4; then
		bestgui=qt
	elif use ncurses; then
		bestgui=text
	else
		bestgui=stdio
	fi
	sed -i 's/^\([[:space:]]*\)\(config_options\['\''cwd'\''\] = .*\)$/\1\2\n\1config_options.setdefault("gui", "'"${bestgui}"'")\n/' electrum-ltc || die

	local plugin
	# trezor requires python trezorlib module
	# keepkey requires trezor
	for plugin in \
		$(usex audio_modem '' audio_modem) \
		$(usex cosign '' cosigner_pool) \
		$(usex digitalbitbox '' digitalbitbox) \
		$(usex email '' email_requests) \
		hw_wallet \
		ledger \
		keepkey \
		$(usex sync '' labels) \
		trezor  \
		$(usex vkb '' virtualkeyboard) \
	; do
		rm -r plugins/"${plugin}"* || die
		sed -i "/${plugin}/d" setup.py || die
	done

	eapply_user

	distutils-r1_src_prepare
}

src_install() {
	doicon -s 128 icons/${PN}.png
	distutils-r1_src_install
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
