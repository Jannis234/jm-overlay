# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Open source PlayStation 3 emulator"
HOMEPAGE="https://rpcs3.net/"

EGIT_REPO_URI="https://github.com/RPCS3/rpcs3.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa pulseaudio evdev vulkan +llvm gdb libav"

RDEPEND=">=dev-qt/qtcore-5.7:5=
	>=dev-qt/qtgui-5.7:5=
	>=dev-qt/qtdbus-5.7:5=
	>=dev-qt/qtwidgets-5.7:5=
	media-libs/libpng:0=
	virtual/opengl
	virtual/glu
	media-libs/glew:0=
	x11-libs/libX11
	virtual/libudev:=
	sys-libs/zlib:=
	media-libs/openal
	llvm? ( sys-devel/llvm:4 )
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )
	evdev? ( dev-libs/libevdev )
	vulkan? ( media-libs/vulkan-loader )
	libav? ( media-video/libav:= )
	!libav? ( media-video/ffmpeg:= )"
DEPEND="${RDEPEND}
	>=sys-devel/gcc-5.1"

DOCS=( README.md CONTRIBUTING.md )

src_configure() {
	local mycmakeargs=(
		-DWITHOUT_LLVM="$(usex llvm OFF ON)"
		-DUSE_ALSA="$(usex alsa)"
		-DUSE_PULSE="$(usex pulseaudio)"
		-DUSE_LIBEVDEV="$(usex evdev)"
		-DUSE_VULKAN="$(usex vulkan)"
		-DWITH_GDB="$(usex gdb)"
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_FFMPEG=ON
	)
	cmake-utils_src_configure
}
