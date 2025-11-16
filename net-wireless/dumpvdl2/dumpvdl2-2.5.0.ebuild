# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="VDL Mode 2 message decoder and protocol analyzer"
HOMEPAGE="https://github.com/szpajder/dumpvdl2"
SRC_URI="https://github.com/szpajder/dumpvdl2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="profiling protobuf rtlsdr sdrplay soapy sqlite zeromq"

DEPEND="dev-libs/glib:2=
	net-wireless/libacars:=
	profiling? ( dev-util/google-perftools:= )
	protobuf? ( dev-libs/protobuf-c:= )
	rtlsdr? ( net-wireless/rtl-sdr:= )
	sdrplay? ( net-wireless/sdrplay:= )
	soapy? ( net-wireless/soapysdr:= )
	sqlite? ( dev-db/sqlite:3= )
	zeromq? ( net-libs/zeromq:= )"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README.md doc/NEWS.md doc/FILTERING_EXAMPLES.md)

src_configure() {
	local mycmakeargs=(
		-DPROFILING=$(usex profiling ON OFF)
		-DRAW_BINARY_FORMAT=$(usex protobuf ON OFF)
		-DRTLSDR=$(usex rtlsdr ON OFF)
		-DSDRPLAY=$(usex sdrplay ON OFF)
		-DSOAPYSDR=$(usex soapy ON OFF)
		-DSQLITE=$(usex sqlite ON OFF)
		-DZMQ=$(usex zeromq ON OFF)
		-DETSY_STATSD=OFF
		-DMIRISDR=OFF
		-DSDRPLAY3=OFF
	)
	cmake_src_configure
}
