# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit linux-info multilib-minimal python-single-r1

DESCRIPTION="Linux control and measurement device interface (userspace libraries)"
HOMEPAGE="http://www.comedi.org/"
SRC_URI="http://www.comedi.org/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs udev firmware pdf python scxi"

DEPEND="udev? ( virtual/udev )
	python? ( ${PYTHON_DEPS} )"
RDEPEND="${DEPEND}
	firmware? ( !sys-kernel/linux-firmware[-savedconfig] )"
BDEPEND="doc? ( app-text/xmlto )
	pdf? ( app-text/dblatex )"
REQUIRED_USE="pdf? ( doc )
	python? ( ${PYTHON_REQUIRED_USE} )"

CONFIG_CHECK="COMEDI"

multilib_src_configure() {
	use python && python_setup
	ECONF_SOURCE="${S}" econf \
		$(use_enable static-libs static) \
		$(use_enable scxi) \
		$(multilib_native_use_enable firmware) \
		$(multilib_native_use_enable doc docbook) \
		$(multilib_native_use_enable python python-binding) \
		$(use_with pdf pdf-backend dblatex) \
		$(use_with udev udev-hotplug "${EPREFIX}/lib")
}

multilib_src_install() {
	default
	use python && python_optimize
}

multilib_src_install_all() {
	cd "${S}"
	dodoc INSTALL AUTHORS ChangeLog NEWS README
}
