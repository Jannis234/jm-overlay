# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

MyPN="vid.stab"
MyP="${MyPN}-${PV}"

DESCRIPTION="Video stabilization library"
HOMEPAGE="http://public.hronopik.de/vid.stab/"
SRC_URI="https://github.com/georgmartius/vid.stab/archive/v${PV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="openmp"

S="${WORKDIR}/${MyP}"
DOCS=( Changelog README.md Todo Install )

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DUSE_OMP=$(usex openmp)
	)
	cmake-utils_src_configure
}
