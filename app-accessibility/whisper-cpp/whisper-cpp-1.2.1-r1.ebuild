# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MyPN="whisper.cpp"
MyP="${MyPN}-${PV}"

DESCRIPTION="Port of OpenAI's Whisper model in C/C++ "
HOMEPAGE="https://github.com/ggerganov/whisper.cpp"
SRC_URI="https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v${PV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas examples +models sdl2 test"

DEPEND="blas? ( sci-libs/openblas:= )
	sdl2? ( media-libs/libsdl2:= )"
RDEPEND="${DEPEND}
	models? ( app-accessibility/whisper-ggml-models )"
BDEPEND=""

S="${WORKDIR}/${MyP}"

src_prepare() {
	# Allow whisper-cpp to automatically find the default model if it's been installed
	use models && eapply "${FILESDIR}/${P}-default-model-path.patch"
	eapply_user
	cmake_src_prepare
}

src_configure() {
	# Turning off examples causes errors during configure
	local mycmakeargs=(
		-DWHISPER_BUILD_EXAMPLES=ON
		-DWHISPER_BUILD_TESTS=$(usex test)
		-DWHISPER_SUPPORT_OPENBLAS=$(usex blas)
		-DWHISPER_SUPPORT_SDL2=$(usex sdl2)
	)
	cmake_src_configure
}

src_install() {
	doheader whisper.h

	use examples && dodoc -r examples
	docinto model-tools
	dodoc models/convert-h5-to-ggml.py
	dodoc models/convert-pt-to-ggml.py

	cd "${BUILD_DIR}" || die
	dolib.so libwhisper.so
	newbin bin/main whisper-cpp
	newbin bin/bench whisper-cpp_bench
	if use sdl2; then
		newbin bin/command whisper-cpp_command
		newbin bin/stream whsiper-cpp_stream
		newbin bin/talk whisper-cpp_talk
	fi
}

pkg_postinst() {
	elog "The main binary has been installed as \"whisper-cpp\""
	elog
	elog "Python scripts to convert custom models have been installed in"
	elog "   ${EROOT}/usr/share/doc/${P}/model-tools"
	elog "These scripts require sci-libs/pytorch to be installed"
}
