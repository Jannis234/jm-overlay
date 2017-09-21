# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="Userspace utilities for a general USB device sharing system over IP networks"
HOMEPAGE="https://www.kernel.org/"
SRC_URI="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.13.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs tcpd doc"

RDEPEND=">=dev-libs/glib-2.6
	sys-apps/hwids
	>=sys-kernel/linux-headers-3.17
	virtual/libudev
	tcpd? ( sys-apps/tcp-wrappers )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="AUTHORS README"

S=${WORKDIR}/linux-${PV}/tools/usb/${PN}

src_prepare() {
	# remove -Werror from build, bug #545398
	sed -i 's/-Werror[^ ]* //g' configure.ac || die
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use tcpd || echo --without-tcp-wrappers) \
		--with-usbids-dir=/usr/share/misc
}

src_install() {
	default
	use doc && dodoc ../../../Documentation/usb/usbip_protocol.txt
	prune_libtool_files
}

pkg_postinst() {
	elog "For using USB/IP you need to enable USBIP_VHCI_HCD in the client"
	elog "machine's kernel config and USBIP_HOST on the server."
}
