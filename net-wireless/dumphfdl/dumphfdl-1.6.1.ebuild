# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Multichannel HFDL decoder"
HOMEPAGE="https://github.com/szpajder/dumphfdl"
SRC_URI="https://github.com/szpajder/dumphfdl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="profiling sdr sqlite zeromq"

DEPEND="dev-libs/glib:2=
	dev-libs/libconfig:=[cxx]
	net-libs/liquid-dsp:=
	net-wireless/libacars:=
	sci-libs/fftw:3.0=
	profiling? ( dev-util/google-perftools:= )
	sdr? ( net-wireless/soapysdr:= )
	sqlite? ( dev-db/sqlite:3= )
	zeromq? ( net-libs/zeromq:= )"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README.md CHANGELOG.md)

src_configure() {
	local mycmakeargs=(
		-DPROFILING=$(usex profiling ON OFF)
		-DSOAPYSDR=$(usex sdr ON OFF)
		-DSQLITE=$(usex sqlite ON OFF)
		-DZMQ=$(usex zeromq ON OFF)
		-DETSY_STATSD=OFF
	)
	cmake_src_configure
}
