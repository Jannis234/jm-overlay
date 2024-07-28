# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ACARS SDR decoder"
HOMEPAGE="https://github.com/TLeconte/acarsdec"
SRC_URI="https://github.com/TLeconte/acarsdec/archive/refs/tags/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="airspy libacars mqtt rtlsdr sndfile"

DEPEND="airspy? ( net-wireless/airspy:= )
	libacars? ( net-wireless/libacars:= )
	mqtt? ( net-libs/paho-mqtt-c:1.3= )
	rtlsdr? ( net-wireless/rtl-sdr:= )
	sndfile? ( media-libs/libsndfile:= )"
RDEPEND="${DEPEND}"
BDEPEND=""
REQUIRED_USE="?? ( airspy rtlsdr )" # Build fails with both enabled

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	# Add options that allow disabling auto-detected dependencies
	eapply "${FILESDIR}/${P}-cmakelists.patch"
	cmake_src_prepare
}

src_configure() {
	# sdrplay needs an unpackaged dependency (*not* net-wireless/sdrplay)
	local mycmakeargs=(
		-Dairspy=$(usex airspy ON OFF)
		-Drtl=$(usex rtlsdr ON OFF)
		-Dsdrplay=OFF
		-Dlibacars_enable=$(usex libacars ON OFF)
		-Dmqtt_enable=$(usex mqtt ON OFF)
		-Dsndfile_enable=$(usex sndfile ON OFF)
	)
	cmake_src_configure
}
