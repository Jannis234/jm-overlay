# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils versionator eutils

DESCRIPTION="Advanced rhythm game, designed for both home and arcade use"
HOMEPAGE="http://www.stepmania.com/"
SRC_URI="https://github.com/stepmania/stepmania/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT default-songs? ( CC-BY-NC-4.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +default-songs alsa oss pulseaudio jack +ffmpeg gles2 +gtk +mp3 +ogg +jpeg networking wav parport crash-handler cpu_flags_x86_sse2"

REQUIRED_USE="|| ( alsa oss pulseaudio jack )"
RDEPEND="virtual/opengl
	app-arch/bzip2
	sys-libs/zlib
	x11-libs/libSM
	x11-libs/libICE
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrandr
	dev-libs/libpcre
	x11-libs/libva
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )
	jack? ( media-sound/jack-audio-connection-kit )
	ffmpeg? ( media-video/ffmpeg )
	gtk? (
		x11-libs/gtk+:2
		dev-libs/glib:2
		x11-libs/gdk-pixbuf:2
		x11-libs/cairo
		x11-libs/pango
	)
	mp3? ( media-libs/libmad )
	ogg? (
		media-libs/libvorbis
		media-libs/libogg
	)"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

src_prepare() {
	eapply "${FILESDIR}/stepmania-select-audio-backends.patch"
	eapply_user
}

src_configure() {
	# Minimaid tries to use pre-built static libraries (x86 only, often fails to link)
	# TTY input fails to compile
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/opt
		-DWITH_CRASH_HANDLER="$(usex crash-handler)"
		-DWITH_ALSA="$(usex alsa)"
		-DWITH_PULSEAUDIO="$(usex pulseaudio)"
		-DWITH_JACK="$(usex jack)"
		-DWITH_OSS="$(usex oss)"
		-DWITH_FFMPEG="$(usex ffmpeg)"
		-DWITH_SYSTEM_FFMPEG="$(usex ffmpeg)"
		-DWITH_GLES2="$(usex gles2)"
		-DWITH_GTK2="$(usex gtk)"
		-DWITH_MP3="$(usex mp3)"
		-DWITH_OGG="$(usex ogg)"
		-DWITH_WAV="$(usex wav)"
		-DWITH_JPEG="$(usex jpeg)"
		-DWITH_PARALLEL_PORT="$(usex parport)"
		-DWITH_NETWORKING="$(usex networking)"
		-DWITH_SSE2="$(usex cpu_flags_x86_sse2)"
		-DWITH_TTY="NO"
		-DWITH_LTO="NO"
		-DWITH_FULL_RELEASE="NO"
		-DWITH_MINIMAID="NO"
		-DWITH_GPL_LIBS="YES"
		-DWITH_PROFILING="NO"
		-DWITH_PORTABLE_TOMCRYPT="YES"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
	if use doc; then
		cd Docs || die
		doxygen || die
	fi
}

src_install() {
	cmake-utils_src_install

	mv "${ED}/opt/${PN}-$(get_version_component_range 1-2)" "${ED}/opt/${PN}" || die
	rm -r "${ED}/opt/${PN}/Docs" || die
	if ! use default-songs; then
		rm -r "${ED}/opt/${PN}/Songs/StepMania 5" || die
	fi

	make_wrapper "${PN}" "${EROOT}opt/${PN}/${PN}"
	newicon "Themes/default/Graphics/ScreenTitleMenu logo/_arrow (dither).png" "${PN}.png"
	make_desktop_entry "${PN}" "Stepmania" "${PN}"

	cd Docs || die
	dodoc Changelog_* CommandLineArgs.txt credits.txt KnownIssues.txt Mapping_keys_for_edit_mode.txt old_changelog.txt versioning.txt Userdocs/*
	use doc && dodoc -r CourseFormat.txt CustomMissionReference.txt Devdocs Luadoc SimfileFormats Themerdocs
	use doc && dodoc -r doxygen/html
}
