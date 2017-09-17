# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit toolchain-funcs eutils

DESCRIPTION="Steam protocol plugin for pidgin"
HOMEPAGE="https://github.com/eionrobb/pidgin-opensteamworks"
SRC_URI="https://github.com/EionRobb/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="polarssl"

RDEPEND="dev-libs/glib:2
	dev-libs/json-glib
	polarssl? ( net-libs/polarssl )
	!polarssl? ( dev-libs/nss )
	gnome-base/libgnome-keyring
	net-im/pidgin"
DEPEND="${RDEPEND}
	app-arch/unzip
	virtual/pkgconfig"

S=${WORKDIR}

pkg_setup() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		tc-export CC PKG_CONFIG
	fi
}

src_prepare() {
	# see https://code.google.com/p/pidgin-opensteamworks/issues/detail?id=31
	cp "${FILESDIR}"/${PN}-1.3-Makefile "${S}"/${P}/steam-mobile/Makefile || die
	unzip "${S}"/${P}/steam-mobile/releases/icons.zip || die

	if use polarssl; then
		sed -i "s/nss //" ${P}/steam-mobile/Makefile
		sed -i "s/ nss)/) -lpolarssl/" ${P}/steam-mobile/Makefile
		sed -i "s/PIC/PIC -DUSE_POLARSSL_CRYPTO/" ${P}/steam-mobile/Makefile
	fi

	epatch_user
}

src_compile() {
	pushd ${P}/steam-mobile || die
	default
	popd || die
}

src_install() {
	pushd ${P}/steam-mobile || die
	default
	popd || die
	insinto /usr/share/pixmaps/pidgin/protocols
	doins -r "${WORKDIR}"/{16,48}
	dodoc ${P}/README.md
}
