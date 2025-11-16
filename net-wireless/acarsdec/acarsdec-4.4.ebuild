# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ACARS SDR decoder"
HOMEPAGE="https://github.com/f00b4r0/acarsdec"
SRC_URI="https://github.com/f00b4r0/acarsdec/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="airspy alsa json libacars mqtt rtlsdr sndfile soapy"

DEPEND="airspy? ( net-wireless/airspy:= )
	alsa? ( media-libs/alsa-lib:= )
	json? ( dev-libs/cJSON:= )
	libacars? ( net-wireless/libacars:= )
	mqtt? ( net-libs/paho-mqtt-c:1.3= )
	rtlsdr? ( net-wireless/rtl-sdr:= )
	sndfile? ( media-libs/libsndfile:= )"
RDEPEND="${DEPEND}"
BDEPEND=""
REQUIRED_USE="mqtt? ( json )"

src_prepare() {
	sed -i "/-Ofast/d" CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	# sdrplay needs an unpackaged dependency (*not* net-wireless/sdrplay)
	local mycmakeargs=(
		-DAIRSPY=$(usex airspy ON OFF)
		-DRTLSDR=$(usex rtlsdr ON OFF)
		-DSDRPLAY=OFF
		-DSOAPYSDR=$(usex soapy ON OFF)
		-DLIBACARS=$(usex libacars ON OFF)
		-DALSA=$(usex alsa ON OFF)
		-DSNDFILE=$(usex sndfile ON OFF)
		-DCJSON=$(usex json ON OFF)
		-DMQTT=$(usex mqtt ON OFF)
	)
	cmake_src_configure
}
