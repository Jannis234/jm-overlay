# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 toolchain-funcs

DESCRIPTION="Open source PlayStation 3 emulator"
HOMEPAGE="https://rpcs3.net/"

EGIT_REPO_URI="https://github.com/RPCS3/rpcs3.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa faudio pulseaudio evdev discord-rpc vulkan +llvm -system-llvm pch"

RDEPEND=">=dev-qt/qtcore-5.15.2:5=
	>=dev-qt/qtgui-5.15.2:5=
	>=dev-qt/qtconcurrent-5.15.2:5=
	>=dev-qt/qtdbus-5.15.2:5=
	>=dev-qt/qtdeclarative-5.15.2:5=
	>=dev-qt/qtnetwork-5.15.2:5=
	>=dev-qt/qtwidgets-5.15.2:5=
	virtual/opengl
	virtual/glu
	media-libs/glew:0=
	virtual/libudev:=
	sys-libs/zlib:=
	llvm? ( system-llvm? ( sys-devel/llvm:11 ) )
	alsa? ( media-libs/alsa-lib:= )
	faudio? ( app-emulation/faudio:= media-libs/libsdl2:= )
	pulseaudio? ( media-sound/pulseaudio:= )
	evdev? ( dev-libs/libevdev:= )
	vulkan? ( media-libs/vulkan-loader[X,wayland] )"
DEPEND="${RDEPEND}"
BDEPEND=">=dev-util/cmake-3.14.1"

# Needed for the bundled LLVM
CMAKE_BUILD_TYPE=RELWITHDEBINFO

pkg_pretend() {
	if [[ "${MERGE_TYPE}" != "binary" ]]; then
		if tc-is-clang; then
			[[ $(clang-major-version) -lt 11 ]] && die "RPCS3 needs >=sys-devel/clang-11 to build"
		elif tc-is-gcc; then
			[[ $(gcc-major-version) -lt 9 ]] && die "RPCS3 needs >=sys-devel/gcc-9 to build"
		else
			die "RPCS3 needs >=sys-devel/clang-11 or >=sys-devel/gcc-9 to build"
		fi
	fi
}

src_configure() {
	local mycmakeargs=(
		-DWITH_LLVM="$(usex llvm)"
		-DBUILD_LLVM_SUBMODULE="$(usex system-llvm OFF ON)"
		-DUSE_ALSA="$(usex alsa)"
		-DUSE_FAUDIO="$(usex faudio)"
		-DUSE_PULSE="$(usex pulseaudio)"
		-DUSE_LIBEVDEV="$(usex evdev)"
		-DUSE_DISCORD_RPC="$(usex discord-rpc)"
		-DUSE_VULKAN="$(usex vulkan)"
		-DUSE_PRECOMPILED_HEADERS="$(usex pch)"
		-DUSE_SYSTEM_ZLIB=ON
		-DUSE_NATIVE_INSTRUCTIONS=OFF
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake-utils_src_configure
}
