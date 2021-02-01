# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit linux-info multilib-minimal

DESCRIPTION="Linux control and measurement device interface (userspace libraries)"
HOMEPAGE="http://www.comedi.org/"
SRC_URI="http://www.comedi.org/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs udev firmware pdf scxi"

RDEPEND="udev? ( virtual/udev )
	firmware? ( !sys-kernel/linux-firmware[-savedconfig] )"
DEPEND="${RDEPEND}
	doc? ( app-text/xmlto )"
REQUIRED_USE="pdf? ( doc )"

CONFIG_CHECK="COMEDI"

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable static-libs static) \
		$(use_enable firmware) \
		$(use_enable scxi) \
		$(use_enable doc docbook) \
		$(use_with pdf pdf-backend default) \
		$(use_with udev udev-hotplug "${EPREFIX}/lib") \
		--disable-python-binding # Python 2 only
}

multilib_src_install() {
	default

	use python && python_optimize
}

multilib_src_install_all() {
	cd "${S}"
	dodoc INSTALL AUTHORS ChangeLog NEWS README
}
