# Copyright 1999-2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} pypy3_11 )

inherit linux-info multilib-minimal python-single-r1

DESCRIPTION="Linux control and measurement device interface (userspace libraries)"
HOMEPAGE="http://www.comedi.org/"
SRC_URI="http://www.comedi.org/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs pdf python scxi"

DEPEND="python? ( ${PYTHON_DEPS} )"
RDEPEND="${DEPEND}"
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
		$(multilib_native_use_enable doc) \
		$(multilib_native_use_enable doc docbook) \
		$(multilib_native_use_enable python python-binding) \
		$(use_with pdf pdf-backend dblatex)
}

multilib_src_install() {
	default
	use python && python_optimize
}
