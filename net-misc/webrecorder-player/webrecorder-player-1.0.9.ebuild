# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )
inherit distutils-r1 git-r3 desktop

DESCRIPTION="Webrecorder Player for Desktop"
HOMEPAGE="https://webrecorder.io/"

SRC_URI="https://github.com/webrecorder/webrecorderplayer-electron/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/webrecorder/webrecorder.git"
EGIT_COMMIT="b9fbf1c0df873e01f86ea5d82c572ba312cdce88"
EGIT_SUBMODULES=()

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="flash"

S="${WORKDIR}/webrecorderplayer-electron-${PV}"

NODE_DEPS="request:2.87.0
	request-promise:4.2.2
	electron-window-state:4.1.1"
RDEPEND="dev-util/electron:1.6
	>=dev-python/bottle-0.12.13[${PYTHON_USEDEP}]
	dev-python/bottle-cork[${PYTHON_USEDEP}]
	dev-python/boto[${PYTHON_USEDEP}]
	net-misc/youtube-dl[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	>=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
	dev-python/marshmallow[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/gevent-websocket[${PYTHON_USEDEP}]
	dev-python/har2warc[${PYTHON_USEDEP}]
	dev-python/fakeredis[${PYTHON_USEDEP}]
	>=dev-python/pywb-0.51[${PYTHON_USEDEP}]
	flash? ( www-plugins/adobe-flash[ppapi] )"
for i in ${NODE_DEPS}; do
	RDEPEND="${RDEPEND} dev-nodejs/$i"
done
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_unpack() {
	default
	git-r3_src_unpack
}

src_prepare() {
	sed -i "s/\"webrecorder\"/\"webrecorder-player\"/g" main.js || die # Run the correct binary (renaming the file would break python-exec)
	eapply_user
	cd "${WORKDIR}/${P}/webrecorder" || die
	rmdir "webrecorder/config/webarchives" || die
	rm -r test || die
	distutils-r1_src_prepare
}

src_configure() {
	cd "${WORKDIR}/${P}/webrecorder" || die
	distutils-r1_src_configure
}

src_compile() {
	mkdir node_modules || die
	cd "${WORKDIR}/${P}/webrecorder" || die
	distutils-r1_src_compile
}

src_install() {
	cd "${WORKDIR}/${P}/webrecorder" || die
	distutils-r1_src_install
	rm "${ED}/usr/bin"/* || die

	cd "${S}" || die
	rm plugins/README.md || die
	insinto "/usr/$(get_libdir)/${PN}"
	doins -r images plugins python-binaries package.json *.js *.css *.html
	dosym "../../python-exec/python-exec2" "/usr/$(get_libdir)/${PN}/python-binaries/webrecorder-player"
	for i in ${NODE_DEPS}; do
		dosym "${EROOT}usr/$(get_libdir)/node/${i/://}" "/usr/$(get_libdir)/${PN}/node_modules/${i%:*}"
	done
	use flash && dosym "${EROOT}usr/$(get_libdir)/chromium/PepperFlash/libpepflashplayer.so" "/usr/$(get_libdir)/${PN}/plugins/libpepflashplayer.so"
	dodoc README.md walkthrough.md

	for i in 32 64 128 256 512; do
		newicon build/icons/${i}x${i}.png "${PN}.png"
	done
	echo "#!/bin/sh" > "${S}/${PN}"
	echo "exec electron-1.6 ${EROOT}usr/$(get_libdir)/${PN}" >> "${S}/${PN}"
	dobin "${S}/${PN}"
	make_desktop_entry "${PN}" "Webrecorder Player" "${PN}"
}
