# Copyright 2023-2024 Gentoo Authors
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
IUSE="blas cuda examples hip +models opencl sdl2 test"

DEPEND="blas? ( virtual/blas )
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	hip? ( sci-libs/hipBLAS:= )
	opencl? ( sci-libs/clblast:= )
	sdl2? ( media-libs/libsdl2:= )"
RDEPEND="${DEPEND}
	models? ( app-accessibility/whisper-ggml-models )"
BDEPEND=""

# Enabling multiple may lead to build failures, whisper-cpp won't use more than one either way
REQUIRED_USE="?? ( blas cuda hip opencl )"

S="${WORKDIR}/${MyP}"

src_prepare() {
	# Allow whisper-cpp to automatically find the default model if it's been installed
	use models && eapply "${FILESDIR}/${P}-default-model-path.patch"
	eapply_user
	cmake_src_prepare
}

src_configure() {
	# Note: CUDA and HIP are currently untested. Build failures may occur.
	# Turning off examples causes errors during configure
	local mycmakeargs=(
		-DWHISPER_BUILD_EXAMPLES=ON
		-DWHISPER_BUILD_TESTS=$(usex test)
		-DWHISPER_BLAS=$(usex blas)
		-DWHISPER_CLBLAST=$(usex opencl)
		-DWHISPER_CUBLAS=$(usex cuda)
		-DWHISPER_HIPBLAS=$(usex hip)
		-DWHISPER_SDL2=$(usex sdl2)
	)
	cmake_src_configure
}

src_install() {
	doheader ggml.h whisper.h

	use examples && dodoc -r examples

	cd "${BUILD_DIR}" || die
	dolib.so libwhisper.so
	newbin bin/main whisper-cpp
	cd bin || die
	for i in *; do
		newbin "$i" "whisper-cpp_$i"
	done
}

pkg_postinst() {
	elog "The main binary has been installed as \"whisper-cpp\""
}
