# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="VDL mode 2 SDR decoder"
HOMEPAGE="https://github.com/TLeconte/vdlm2dec"
SRC_URI="https://github.com/TLeconte/vdlm2dec/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="airspy libacars rtlsdr"

DEPEND="airspy? ( net-wireless/airspy:= )
	libacars? ( net-wireless/libacars:= )
	rtlsdr? ( net-wireless/rtl-sdr:= )"
RDEPEND="${DEPEND}"
BDEPEND=""
REQUIRED_USE="?? ( airspy rtlsdr )"

src_prepare() {
	eapply "${FILESDIR}/${P}-cmakelists.patch"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-Dairspy=$(usex airspy ON OFF)
		-Drtl=$(usex rtlsdr ON OFF)
		-Dlibacars_enable=$(usex libacars ON OFF)
	)
	cmake_src_configure
}
