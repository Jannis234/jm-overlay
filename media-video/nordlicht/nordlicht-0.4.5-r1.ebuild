# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake-multilib

DESCRIPTION="library + tool that creates colorful video barcodes"
HOMEPAGE="https://nordlicht.github.io/"
SRC_URI="https://github.com/blinry/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	test? ( https://upload.wikimedia.org/wikipedia/commons/6/64/Sintel_excerpt.ogv -> ${PN}-testdata-r2.ogv )"

LICENSE="GPL-2+ BSD BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-libs/popt[${MULTILIB_USEDEP}]
	media-video/ffmpeg:=[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	sys-apps/help2man"

DOCS=( README.md CHANGELOG.md )

src_unpack() {
	default
	if use test; then
		cp "${DISTDIR}/${PN}-testdata-r2.ogv" "${S}/video.mp4" || die
	fi
}

src_prepare() {
	eapply_user
	cmake_src_prepare
	use test && multilib_copy_sources
}

multilib_src_test() {
	./testsuite || die "Tests failed"
}
