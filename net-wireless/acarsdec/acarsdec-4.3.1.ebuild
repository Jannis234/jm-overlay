# Copyright 2024 Gentoo Authors
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
	# Add options that allow disabling auto-detected dependencies
	eapply "${FILESDIR}/${P}-cmakelists.patch"
	cmake_src_prepare
}

src_configure() {
	# sdrplay needs an unpackaged dependency (*not* net-wireless/sdrplay)
	local mycmakeargs=(
		-Dairspy_enable=$(usex airspy ON OFF)
		-Drtl_enable=$(usex rtlsdr ON OFF)
		-Dsdrplay_enable=OFF
		-Dsoapy_enable=$(usex soapy ON OFF)
		-Dlibacars_enable=$(usex libacars ON OFF)
		-Dalsa_enable=$(usex alsa ON OFF)
		-Dlibsndfile_enable=$(usex sndfile ON OFF)
		-Dcjson_enable=$(usex json ON OFF)
		-Dmqtt_enable=$(usex mqtt ON OFF)
	)
	cmake_src_configure
}
