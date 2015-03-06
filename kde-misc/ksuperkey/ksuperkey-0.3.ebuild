# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A utility that redirects the superkey (aka 'Windows key') to another key combination so it can be used as a hotkey in KDE"
HOMEPAGE="http://kde-apps.org/content/show.php?content=154569"
SRC_URI="http://kde-apps.org/CONTENT/content-files/154569-ksuperkey-${PV}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="x11-libs/libX11
		 x11-libs/libXtst"
DEPEND="${REPEND}
		dev-util/pkgconfig"

src_prepare() {

	sed -i \
		-e "/-Wall/a\CFLAGS += \$(CUSTOM_CFLAGS)" \
		-e "/-pthread/a\LDFLAGS += \$(CUSTOM_LDFLAGS)" \
		Makefile || die

}

src_compile() {

	emake CUSTOM_CFLAGS="${CFLAGS}" CUSTOM_LDFLAGS="${LDFLAGS}" || die

}

src_install() {

	emake install PREFIX="${D}/usr" || die

	dodoc README.md
	dodoc LICENSE

}

pkg_postinst() {

	elog "If you want ksuperkey to auto-start with KDE, you might want to create a symlink to /usr/bin/ksuperkey in ~/.kde4/Autostart/"

}

